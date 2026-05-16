/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function common9Jsunit() {
  describe('common_part2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("common_Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/common_9',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get common_Jsunit state pages: " + JSON.stringify(pages));
        if (!("common_9" == pages.name)) {
          console.info("get common_Jsunit state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push common_Jsunit page error: " + err);
      }
      done();
    });

    beforeEach(async () => {
      await Utils.sleep(100);
      console.info("common_Jsunit before each called");
    })

    /**
     * @tc.name   common_focusable
     * @tc.number common_0001
     * @tc.desc   Set focusable values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_focusable', Level.LEVEL0, async (done: Function) => {
      console.info('[common_focusable] START');
      let strJson = getInspectorByKey('buttonModifier');
      console.info("[common_focusable] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.focusable).assertEqual(false);
      console.info('[common_focusable] END');
      done();
    });

    /**
     * @tc.name   common_tabIndex
     * @tc.number common_0002
     * @tc.desc   Set tabIndex values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_tabIndex', Level.LEVEL0, async (done: Function) => {
      console.info('[common_tabIndex] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_tabIndex] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.tabIndex).assertEqual(3);
      console.info('[common_tabIndex] END');
      done();
    });

    /**
     * @tc.name   common_defaultFocus
     * @tc.number common_0003
     * @tc.desc   Set defaultFocus values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_defaultFocus', Level.LEVEL0, async (done: Function) => {
      console.info('[common_defaultFocus] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_defaultFocus] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.defaultFocus).assertEqual(true);
      console.info('[common_defaultFocus] END');
      done();
    });

    /**
     * @tc.name   common_groupDefaultFocus
     * @tc.number common_0004
     * @tc.desc   Set groupDefaultFocus values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_groupDefaultFocus', Level.LEVEL0, async (done: Function) => {
      console.info('[common_groupDefaultFocus] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_groupDefaultFocus] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.groupDefaultFocus).assertEqual(false);
      console.info('[common_groupDefaultFocus] END');
      done();
    });

    /**
     * @tc.name   common_focusOnTouch
     * @tc.number common_0005
     * @tc.desc   Set focusOnTouch values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_focusOnTouch', Level.LEVEL0, async (done: Function) => {
      console.info('[common_focusOnTouch] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_focusOnTouch] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.focusOnTouch).assertEqual(true);
      console.info('[common_focusOnTouch] END');
      done();
    });

    /**
     * @tc.name   common_brightness
     * @tc.number common_0006
     * @tc.desc   Set brightness values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_brightness', Level.LEVEL0, async (done: Function) => {
      console.info('[common_brightness] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_brightness] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.brightness).assertEqual(1);
      console.info('[common_brightness] END');
      done();
    });

    /**
     * @tc.name   common_contrast
     * @tc.number common_0007
     * @tc.desc   Set contrast values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_contrast', Level.LEVEL0, async (done: Function) => {
      console.info('[common_contrast] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_contrast] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.contrast).assertEqual(1);
      console.info('[common_contrast] END');
      done();
    });

    /**
     * @tc.name   common_grayscale
     * @tc.number common_0008
     * @tc.desc   Set grayscale values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_grayscale', Level.LEVEL0, async (done: Function) => {
      console.info('[common_grayscale] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_grayscale] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.grayscale).assertEqual(1);
      console.info('[common_grayscale] END');
      done();
    });

    /**
     * @tc.name   common_colorBlend
     * @tc.number common_0009
     * @tc.desc   Set colorBlend values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_colorBlend', Level.LEVEL0, async (done: Function) => {
      console.info('[common_colorBlend] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_colorBlend] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.colorBlend).assertEqual('#FFFFA500');
      console.info('[common_colorBlend] END');
      done();
    });

    /**
     * @tc.name   common_saturate
     * @tc.number common_0010
     * @tc.desc   Set saturate values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_saturate', Level.LEVEL0, async (done: Function) => {
      console.info('[common_saturate] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_saturate] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.saturate).assertEqual(2);
      console.info('[common_saturate] END');
      done();
    });

    /**
     * @tc.name   common_foregroundColor
     * @tc.number common_0011
     * @tc.desc   Set foregroundColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_foregroundColor', Level.LEVEL0, async (done: Function) => {
      console.info('[common_foregroundColor] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_foregroundColor] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.foregroundColor).assertEqual('#FF0000FF');
      console.info('[common_foregroundColor] END');
      done();
    });

    /**
     * @tc.name   common_borderImage
     * @tc.number common_0012
     * @tc.desc   Set borderImage values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_borderImage', Level.LEVEL0, async (done: Function) => {
      console.info('[common_borderImage] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_borderImage] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.borderImage)
        .assertEqual('{\"source\":\"\",\"slice\":\"0.00px\",\"width\":\"0.00px\",\"outset\":\"0.00px\",\"repeat\":\"RepeatMode.Stretch\",\"fill\":\"false\"}');
      console.info('[common_borderImage] END');
      done();
    });

    /**
     * @tc.name   common_borderWidth
     * @tc.number common_0013
     * @tc.desc   Set borderWidth values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_borderWidth', Level.LEVEL0, async (done: Function) => {
      console.info('[common_borderWidth] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_borderWidth] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.borderWidth.left).assertEqual('3.00vp');
      expect(JSON.parse(strJson).$attrs.borderWidth.top).assertEqual('3.00vp');
      expect(JSON.parse(strJson).$attrs.borderWidth.bottom).assertEqual('3.00vp');
      expect(JSON.parse(strJson).$attrs.borderWidth.right).assertEqual('3.00vp');
      console.info('[common_borderWidth] END');
      done();
    });

    /**
     * @tc.name   common_borderColor
     * @tc.number common_0014
     * @tc.desc   Set borderColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_borderColor', Level.LEVEL0, async (done: Function) => {
      console.info('[common_borderColor] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_borderColor] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.borderColor.left).assertEqual('#FFFF0000');
      expect(JSON.parse(strJson).$attrs.borderColor.right).assertEqual('#FFFF0000');
      expect(JSON.parse(strJson).$attrs.borderColor.top).assertEqual('#FFFF0000');
      expect(JSON.parse(strJson).$attrs.borderColor.bottom).assertEqual('#FFFF0000');
      console.info('[common_borderColor] END');
      done();
    });

    /**
     * @tc.name   common_borderStyle
     * @tc.number common_0015
     * @tc.desc   Set borderStyle values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_borderStyle', Level.LEVEL0, async (done: Function) => {
      console.info('[common_borderStyle] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_borderStyle] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.borderStyle).assertEqual('BorderStyle.Dotted');
      console.info('[common_borderStyle] END');
      done();
    });

    /**
     * @tc.name   common_borderRadius
     * @tc.number common_0016
     * @tc.desc   Set borderRadius values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_borderRadius', Level.LEVEL0, async (done: Function) => {
      console.info('[common_borderRadius] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_borderRadius] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.borderRadius.topLeft).assertEqual('30.00vp');
      expect(JSON.parse(strJson).$attrs.borderRadius.topRight).assertEqual('30.00vp');
      expect(JSON.parse(strJson).$attrs.borderRadius.bottomLeft).assertEqual('30.00vp');
      expect(JSON.parse(strJson).$attrs.borderRadius.bottomRight).assertEqual('30.00vp');
      console.info('[common_borderRadius] END');
      done();
    });

    /**
     * @tc.name   common_border
     * @tc.number common_0017
     * @tc.desc   Set border values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_border', Level.LEVEL0, async (done: Function) => {
      console.info('[common_border] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[common_border] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      let border_obj: ESObject =  JSON.parse(obj.$attrs.border);
      console.info("[common_border] border_obj is : " + JSON.stringify(obj.$attrs.border));
      
      expect(border_obj.style.left).assertEqual("BorderStyle.Dashed");
      expect(border_obj.style.right).assertEqual("BorderStyle.Dotted");
      expect(border_obj.style.top).assertEqual("BorderStyle.Solid");
      expect(border_obj.style.bottom).assertEqual("BorderStyle.Dashed");
      
      expect(border_obj.width.left).assertEqual("3.00vp");
      expect(border_obj.width.right).assertEqual("6.00vp");
      expect(border_obj.width.top).assertEqual("10.00vp");
      expect(border_obj.width.bottom).assertEqual("15.00vp");
      expect(border_obj.width.start).assertEqual("0.00vp");
      expect(border_obj.width.end).assertEqual("0.00vp");

      expect(border_obj.color.left).assertEqual('#FF000000');
      expect(border_obj.color.right).assertEqual('#FF000000');
      expect(border_obj.color.top).assertEqual('#FF0F0F0F');
      expect(border_obj.color.bottom).assertEqual('#FFF0F0F0');
      
      expect(border_obj.radius.topLeft).assertEqual("10.00vp");
      expect(border_obj.radius.topRight).assertEqual("20.00vp");
      expect(border_obj.radius.bottomLeft).assertEqual("40.00vp");
      expect(border_obj.radius.bottomRight).assertEqual("80.00vp");

      expect(border_obj.dashGap).assertEqual("-1.00px");
      expect(border_obj.dashWidth).assertEqual("-1.00px");
      
      console.info('[common_border] END');
      done();
    });

    /**
     * @tc.name   common_backgroundBlurStyle
     * @tc.number common_0018
     * @tc.desc   Set backgroundBlurStyle values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_backgroundBlurStyle', Level.LEVEL0, async (done: Function) => {
      console.info('[common_backgroundBlurStyle] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_backgroundBlurStyle] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundBlurStyle.value).assertEqual("BlurStyle.Thin");
      expect(JSON.parse(strJson)
        .$attrs
        .backgroundBlurStyle
        .options
        .colorMode).assertEqual("ThemeColorMode.System");
      console.info('[common_backgroundBlurStyle] END');
      done();
    });

    /**
     * @tc.name   common_monopolizeEvents
     * @tc.number common_0019
     * @tc.desc   Set monopolizeEvents values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_monopolizeEvents', Level.LEVEL0, async (done: Function) => {
      console.info('[common_monopolizeEvents] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_monopolizeEvents] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.monopolizeEvents).assertEqual(false);
      console.info('[common_monopolizeEvents] END');
      done();
    });

    /**
     * @tc.name   common_backgroundImage
     * @tc.number common_0020
     * @tc.desc   Set backgroundImage values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_backgroundImage', Level.LEVEL0, async (done: Function) => {
      console.info('[common_backgroundImage] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_backgroundImage] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundImage).assertEqual("resource:///16777261.png, ImageRepeat.X");
      console.info('[common_backgroundImage] END');
      done();
    });

    /**
     * @tc.name   common_backgroundImageSize
     * @tc.number common_0021
     * @tc.desc   Set backgroundImageSize values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_backgroundImageSize', Level.LEVEL0, async (done: Function) => {
      console.info('[common_backgroundImageSize] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_backgroundImageSize] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundImageSize)
        .assertEqual('{\"width\":\"150.00px\",\"height\":\"150.00px\"}');
      console.info('[common_backgroundImageSize] END');
      done();
    });

    /**
     * @tc.name   common_backgroundImagePosition
     * @tc.number common_0022
     * @tc.desc   Set backgroundImagePosition values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_backgroundImagePosition', Level.LEVEL0, async (done: Function) => {
      console.info('[common_backgroundImagePosition] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_backgroundImagePosition] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundImagePosition).assertEqual("{\"x\":144,\"y\":144}");
      console.info('[common_backgroundImagePosition] END');
      done();
    });

    /**
     * @tc.name   common_size
     * @tc.number common_0023
     * @tc.desc   Set size values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_size', Level.LEVEL0, async (done: Function) => {
      console.info('[common_size] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_size] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.size.width).assertEqual("144.00vp");
      expect(JSON.parse(strJson).$attrs.size.height).assertEqual("144.00vp");
      console.info('[common_size] END');
      done();
    });


    /**
     * @tc.name   common_pixelStretchEffect
     * @tc.number common_0024
     * @tc.desc   Set pixelStretchEffect values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_pixelStretchEffect', Level.LEVEL0, async (done: Function) => {
      console.info('[common_pixelStretchEffect] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_pixelStretchEffect] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.pixelStretchEffect.left).assertEqual("5.00vp");
      expect(JSON.parse(strJson).$attrs.pixelStretchEffect.right).assertEqual("5.00vp");
      expect(JSON.parse(strJson).$attrs.pixelStretchEffect.top).assertEqual("5.00vp");
      expect(JSON.parse(strJson).$attrs.pixelStretchEffect.bottom).assertEqual("5.00vp");
      console.info('[common_pixelStretchEffect] END');
      done();
    });

    /**
     * @tc.name   common_backgroundBrightness
     * @tc.number common_0025
     * @tc.desc   Set backgroundBrightness values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_backgroundBrightness', Level.LEVEL0, async (done: Function) => {
      console.info('[common_backgroundBrightness] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_backgroundBrightness] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundBrightness).assertEqual(undefined);
      console.info('[common_backgroundBrightness] END');
      done();
    });

    /**
     * @tc.name   common_dragPreviewOptions
     * @tc.number common_0026
     * @tc.desc   Set dragPreviewOptions values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_dragPreviewOptions', Level.LEVEL0, async (done: Function) => {
      console.info('[common_dragPreviewOptions] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_dragPreviewOptions] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.dragPreviewOptions).assertEqual(undefined);
      console.info('[common_dragPreviewOptions] END');
      done();
    });

    /**
     * @tc.name   common_layoutWeight
     * @tc.number common_0027
     * @tc.desc   Set layoutWeight values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_layoutWeight', Level.LEVEL0, async (done: Function) => {
      console.info('[common_layoutWeight] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_layoutWeight] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.layoutWeight).assertEqual(2);
      console.info('[common_layoutWeight] END');
      done();
    });

    /**
     * @tc.name   common_constraintSize
     * @tc.number common_0028
     * @tc.desc   Set constraintSize values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_constraintSize', Level.LEVEL0, async (done: Function) => {
      console.info('[common_constraintSize] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_constraintSize] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.constraintSize)
        .assertEqual("{\"minWidth\":\"10.00vp\",\"minHeight\":\"15.00vp\",\"maxWidth\":\"20.00vp\",\"maxHeight\":\"30.00vp\"}");
      console.info('[common_constraintSize] END');
      done();
    });

    /**
     * @tc.name   common_useEffect
     * @tc.number common_0029
     * @tc.desc   Set useEffect values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_useEffect', Level.LEVEL0, async (done: Function) => {
      console.info('[common_useEffect] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_useEffect] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.useEffect).assertEqual('true');
      console.info('[common_useEffect] END');
      done();
    });

    /**
     * @tc.name   common_sphericalEffect
     * @tc.number common_0030
     * @tc.desc   Set sphericalEffect values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_sphericalEffect', Level.LEVEL0, async (done: Function) => {
      console.info('[common_sphericalEffect] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_sphericalEffect] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.sphericalEffect).assertEqual(1);
      console.info('[common_sphericalEffect] END');
      done();
    });

    /**
     * @tc.name   common_hitTestBehavior
     * @tc.number common_0031
     * @tc.desc   Set hitTestBehavior values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_hitTestBehavior', Level.LEVEL0, async (done: Function) => {
      console.info('[common_hitTestBehavior] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_hitTestBehavior] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.hitTestBehavior).assertEqual('HitTestMode.Default');
      console.info('[common_hitTestBehavior] END');
      done();
    });


    /**
     * @tc.name   common_lightUpEffect
     * @tc.number common_0032
     * @tc.desc   Set lightUpEffect values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_lightUpEffect', Level.LEVEL0, async (done: Function) => {
      console.info('[common_lightUpEffect] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_lightUpEffect] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.lightUpEffect).assertEqual(1);
      console.info('[common_lightUpEffect] END');
      done();
    });

    /**
     * @tc.name   common_width
     * @tc.number common_0033
     * @tc.desc   Set width values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_width', Level.LEVEL0, async (done: Function) => {
      console.info('[common_width] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_width] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.width).assertEqual("144.00vp");
      console.info('[common_width] END');
      done();
    });

    /**
     * @tc.name   common_height
     * @tc.number common_0034
     * @tc.desc   Set height values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_height', Level.LEVEL0, async (done: Function) => {
      console.info('[common_height] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_height] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.height).assertEqual("144.00vp");
      console.info('[common_height] END');
      done();
    });

    /**
     * @tc.name   common_expandSafeArea
     * @tc.number common_0035
     * @tc.desc   Set expandSafeArea values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_expandSafeArea', Level.LEVEL0, async (done: Function) => {
      console.info('[common_expandSafeArea] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_expandSafeArea] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.expandSafeArea).assertEqual(undefined);
      console.info('[common_expandSafeArea] END');
      done();
    });

    /**
     * @tc.name   common_responseRegion
     * @tc.number common_0036
     * @tc.desc   Set responseRegion values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_responseRegion', Level.LEVEL0, async (done: Function) => {
      console.info('[common_responseRegion] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_responseRegion] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.responseRegion[0])
        .assertEqual("{\"x\":\"0.00vp\",\"y\":\"0.00vp\",\"width\":\"50.00%\",\"height\":\"100.00%\"}");
      console.info('[common_responseRegion] END');
      done();
    });

    /**
     * @tc.name   common_visibility
     * @tc.number common_0037
     * @tc.desc   Set visibility values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_visibility', Level.LEVEL0, async (done: Function) => {
      console.info('[common_visibility] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_visibility] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('[common_visibility] END');
      done();
    });

    /**
     * @tc.name   common_opacity
     * @tc.number common_0038
     * @tc.desc   Set opacity values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_opacity', Level.LEVEL0, async (done: Function) => {
      console.info('[common_opacity] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_opacity] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info('[common_opacity] END');
      done();
    });

    /**
     * @tc.name   common_margin
     * @tc.number common_0039
     * @tc.desc   Set margin values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_margin', Level.LEVEL0, async (done: Function) => {
      console.info('[common_margin] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_margin] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.margin).assertEqual("20.00vp");
      console.info('[common_margin] END');
      done();
    });

    /**
     * @tc.name   common_padding
     * @tc.number common_0040
     * @tc.desc   Set padding values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_padding', Level.LEVEL0, async (done: Function) => {
      console.info('[common_padding] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_padding] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("1.00vp");
      console.info('[common_padding] END');
      done();
    });

    /**
     * @tc.name   common_backgroundColor
     * @tc.number common_0041
     * @tc.desc   Set backgroundColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_backgroundColor', Level.LEVEL0, async (done: Function) => {
      console.info('[common_backgroundColor] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_backgroundColor] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FFFF0000");
      console.info('[common_backgroundColor] END');
      done();
    });

    /**
     * @tc.name   common_linearGradient
     * @tc.number common_0042
     * @tc.desc   Set linearGradient values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_linearGradient', Level.LEVEL0, async (done: Function) => {
      console.info('[common_linearGradient] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_linearGradient] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.linearGradient.direction).assertEqual("GradientDirection.Left");
      console.info('[common_linearGradient] END');
      done();
    });

    /**
     * @tc.name   common_linearGradientBlur
     * @tc.number common_0043
     * @tc.desc   Set linearGradientBlur values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_linearGradientBlur', Level.LEVEL0, async (done: Function) => {
      console.info('[common_linearGradientBlur] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_linearGradientBlur] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.linearGradientBlur.value).assertEqual('60.00px');
      console.info('[common_linearGradientBlur] END');
      done();
    });

    /**
     * @tc.name   common_blendMode
     * @tc.number common_0044
     * @tc.desc   Set blendMode values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_blendMode', Level.LEVEL0, async (done: Function) => {
      console.info('[common_blendMode] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_blendMode] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(16);
      console.info('[common_blendMode] END');
      done();
    });
    /**
     * @tc.name   common_accessibilityLevel
     * @tc.number common_0045
     * @tc.desc   Set accessibilityLevel values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_accessibilityLevel', Level.LEVEL0, async (done: Function) => {
      console.info('[common_accessibilityLevel] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityLevel] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityLevel).assertEqual("auto");
      console.info('[common_accessibilityLevel] END');
      done();
    });
    /**
     * @tc.name   common_accessibilityDescription
     * @tc.number common_0046
     * @tc.desc   Set accessibilityDescription values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_accessibilityDescription', Level.LEVEL0, async (done: Function) => {
      console.info('[common_accessibilityDescription] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityDescription] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityDescription).assertEqual("");
      console.info('[common_accessibilityDescription] END');
      done();
    });

    /**
     * @tc.name   common_accessibilityText
     * @tc.number common_0047
     * @tc.desc   Set accessibilityText values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_accessibilityText', Level.LEVEL0, async (done: Function) => {
      console.info('[common_accessibilityText] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityText] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityText).assertEqual("");
      console.info('[common_accessibilityText] END');
      done();
    });

    /**
     * @tc.name   common_accessibilityGroup
     * @tc.number common_0048
     * @tc.desc   Set accessibilityGroup values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_accessibilityGroup', Level.LEVEL0, async (done: Function) => {
      console.info('[common_accessibilityGroup] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityGroup] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityGroup).assertEqual(false);
      console.info('[common_accessibilityGroup] END');
      done();
    });

    /**
     * @tc.name   common_restoreId
     * @tc.number common_0049
     * @tc.desc   Set restoreId values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_restoreId', Level.LEVEL0, async (done: Function) => {
      console.info('[common_restoreId] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_restoreId] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.restoreId).assertEqual(undefined);
      console.info('[common_restoreId] END');
      done();
    });

    /**
     * @tc.name   common_allowDrop
     * @tc.number common_0050
     * @tc.desc   Set allowDrop values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_allowDrop', Level.LEVEL0, async (done: Function) => {
      console.info('[common_allowDrop] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_allowDrop] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.allowDrop).assertEqual(undefined);
      console.info('[common_allowDrop] END');
      done();
    });

    /**
     * @tc.name   common_alignRules
     * @tc.number common_0051
     * @tc.desc   Set alignRules values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_alignRules', Level.LEVEL0, async (done: Function) => {
      console.info('[common_alignRules] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_alignRules] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.alignRules).assertEqual(undefined);
      console.info('[common_alignRules] END');
      done();
    });

    /**
     * @tc.name   common_foregroundBlurStyle
     * @tc.number common_0052
     * @tc.desc   Set foregroundBlurStyle values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('common_foregroundBlurStyle', Level.LEVEL0, async (done: Function) => {
      console.info('[common_foregroundBlurStyle] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_foregroundBlurStyle] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.foregroundBlurStyle).assertEqual(undefined);
      console.info('[common_foregroundBlurStyle] END');
      done();
    });
  })
}
