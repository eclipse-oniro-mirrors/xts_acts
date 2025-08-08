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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
     * @tc.number common_0001
     * @tc.name Test the properties of components
     * @tc.desc Set focusable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_focusable', 0, async (done: Function) => {
      console.info('[common_focusable] START');
      let strJson = getInspectorByKey('buttonModifier');
      console.info("[common_focusable] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.focusable).assertEqual(false);
      console.info('[common_focusable] END');
      done();
    });

    /**
     * @tc.number common_0002
     * @tc.name Test the properties of components
     * @tc.desc Set tabIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_tabIndex', 0, async (done: Function) => {
      console.info('[common_tabIndex] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_tabIndex] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.tabIndex).assertEqual(3);
      console.info('[common_tabIndex] END');
      done();
    });

    /**
     * @tc.number common_0003
     * @tc.name Test the properties of components
     * @tc.desc Set defaultFocus values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_defaultFocus', 0, async (done: Function) => {
      console.info('[common_defaultFocus] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_defaultFocus] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.defaultFocus).assertEqual(true);
      console.info('[common_defaultFocus] END');
      done();
    });

    /**
     * @tc.number common_0004
     * @tc.name Test the properties of components
     * @tc.desc Set groupDefaultFocus values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_groupDefaultFocus', 0, async (done: Function) => {
      console.info('[common_groupDefaultFocus] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_groupDefaultFocus] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.groupDefaultFocus).assertEqual(false);
      console.info('[common_groupDefaultFocus] END');
      done();
    });

    /**
     * @tc.number common_0005
     * @tc.name Test the properties of components
     * @tc.desc Set focusOnTouch values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_focusOnTouch', 0, async (done: Function) => {
      console.info('[common_focusOnTouch] START');
      let strJson = getInspectorByKey('buttonModifier');

      console.info("[common_focusOnTouch] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.focusOnTouch).assertEqual(true);
      console.info('[common_focusOnTouch] END');
      done();
    });

    /**
     * @tc.number common_0006
     * @tc.name Test the properties of components
     * @tc.desc Set brightness values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_brightness', 0, async (done: Function) => {
      console.info('[common_brightness] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_brightness] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.brightness).assertEqual(1);
      console.info('[common_brightness] END');
      done();
    });

    /**
     * @tc.number common_0007
     * @tc.name Test the properties of components
     * @tc.desc Set contrast values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_contrast', 0, async (done: Function) => {
      console.info('[common_contrast] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_contrast] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.contrast).assertEqual(1);
      console.info('[common_contrast] END');
      done();
    });

    /**
     * @tc.number common_0008
     * @tc.name Test the properties of components
     * @tc.desc Set grayscale values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_grayscale', 0, async (done: Function) => {
      console.info('[common_grayscale] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_grayscale] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.grayscale).assertEqual(1);
      console.info('[common_grayscale] END');
      done();
    });

    /**
     * @tc.number common_0009
     * @tc.name Test the properties of components
     * @tc.desc Set colorBlend values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_colorBlend', 0, async (done: Function) => {
      console.info('[common_colorBlend] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_colorBlend] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.colorBlend).assertEqual('#FFFFA500');
      console.info('[common_colorBlend] END');
      done();
    });

    /**
     * @tc.number common_0010
     * @tc.name Test the properties of components
     * @tc.desc Set saturate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_saturate', 0, async (done: Function) => {
      console.info('[common_saturate] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_saturate] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.saturate).assertEqual(2);
      console.info('[common_saturate] END');
      done();
    });

    /**
     * @tc.number common_0011
     * @tc.name Test the properties of components
     * @tc.desc Set foregroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_foregroundColor', 0, async (done: Function) => {
      console.info('[common_foregroundColor] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_foregroundColor] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.foregroundColor).assertEqual('#FF0000FF');
      console.info('[common_foregroundColor] END');
      done();
    });

    /**
     * @tc.number common_0012
     * @tc.name Test the properties of components
     * @tc.desc Set borderImage values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_borderImage', 0, async (done: Function) => {
      console.info('[common_borderImage] START');
      let strJson = getInspectorByKey('textModifier');

      console.info("[common_borderImage] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.borderImage)
        .assertEqual('{\"source\":\"\",\"slice\":\"0.00px\",\"width\":\"0.00px\",\"outset\":\"0.00px\",\"repeat\":\"RepeatMode.Stretch\",\"fill\":\"false\"}');
      console.info('[common_borderImage] END');
      done();
    });

    /**
     * @tc.number common_0013
     * @tc.name Test the properties of components
     * @tc.desc Set borderWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_borderWidth', 0, async (done: Function) => {
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
     * @tc.number common_0014
     * @tc.name Test the properties of components
     * @tc.desc Set borderColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_borderColor', 0, async (done: Function) => {
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
     * @tc.number common_0015
     * @tc.name Test the properties of components
     * @tc.desc Set borderStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_borderStyle', 0, async (done: Function) => {
      console.info('[common_borderStyle] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_borderStyle] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.borderStyle).assertEqual('BorderStyle.Dotted');
      console.info('[common_borderStyle] END');
      done();
    });

    /**
     * @tc.number common_0016
     * @tc.name Test the properties of components
     * @tc.desc Set borderRadius values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_borderRadius', 0, async (done: Function) => {
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
     * @tc.number common_0017
     * @tc.name Test the properties of components
     * @tc.desc Set border values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_border', 0, async (done: Function) => {
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
     * @tc.number common_0018
     * @tc.name Test the properties of components
     * @tc.desc Set backgroundBlurStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_backgroundBlurStyle', 0, async (done: Function) => {
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
     * @tc.number common_0019
     * @tc.name Test the properties of components
     * @tc.desc Set monopolizeEvents values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_monopolizeEvents', 0, async (done: Function) => {
      console.info('[common_monopolizeEvents] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_monopolizeEvents] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.monopolizeEvents).assertEqual(false);
      console.info('[common_monopolizeEvents] END');
      done();
    });

    /**
     * @tc.number common_0020
     * @tc.name Test the properties of components
     * @tc.desc Set backgroundImage values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_backgroundImage', 0, async (done: Function) => {
      console.info('[common_backgroundImage] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_backgroundImage] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundImage).assertEqual("resource:///16777261.png, ImageRepeat.X");
      console.info('[common_backgroundImage] END');
      done();
    });

    /**
     * @tc.number common_0021
     * @tc.name Test the properties of components
     * @tc.desc Set backgroundImageSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_backgroundImageSize', 0, async (done: Function) => {
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
     * @tc.number common_0022
     * @tc.name Test the properties of components
     * @tc.desc Set backgroundImagePosition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_backgroundImagePosition', 0, async (done: Function) => {
      console.info('[common_backgroundImagePosition] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_backgroundImagePosition] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundImagePosition).assertEqual("{\"x\":144,\"y\":144}");
      console.info('[common_backgroundImagePosition] END');
      done();
    });

    /**
     * @tc.number common_0023
     * @tc.name Test the properties of components
     * @tc.desc Set size values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_size', 0, async (done: Function) => {
      console.info('[common_size] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_size] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.size.width).assertEqual("144.00vp");
      expect(JSON.parse(strJson).$attrs.size.height).assertEqual("144.00vp");
      console.info('[common_size] END');
      done();
    });


    /**
     * @tc.number common_0024
     * @tc.name Test the properties of components
     * @tc.desc Set pixelStretchEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_pixelStretchEffect', 0, async (done: Function) => {
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
     * @tc.number common_0025
     * @tc.name Test the properties of components
     * @tc.desc Set backgroundBrightness values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_backgroundBrightness', 0, async (done: Function) => {
      console.info('[common_backgroundBrightness] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_backgroundBrightness] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundBrightness).assertEqual(undefined);
      console.info('[common_backgroundBrightness] END');
      done();
    });

    /**
     * @tc.number common_0026
     * @tc.name Test the properties of components
     * @tc.desc Set dragPreviewOptions values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_dragPreviewOptions', 0, async (done: Function) => {
      console.info('[common_dragPreviewOptions] START');
      let strJson = getInspectorByKey('textModifier2');

      console.info("[common_dragPreviewOptions] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.dragPreviewOptions).assertEqual(undefined);
      console.info('[common_dragPreviewOptions] END');
      done();
    });

    /**
     * @tc.number common_0027
     * @tc.name Test the properties of components
     * @tc.desc Set layoutWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_layoutWeight', 0, async (done: Function) => {
      console.info('[common_layoutWeight] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_layoutWeight] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.layoutWeight).assertEqual(2);
      console.info('[common_layoutWeight] END');
      done();
    });

    /**
     * @tc.number common_0028
     * @tc.name Test the properties of components
     * @tc.desc Set constraintSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_constraintSize', 0, async (done: Function) => {
      console.info('[common_constraintSize] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_constraintSize] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.constraintSize)
        .assertEqual("{\"minWidth\":\"10.00vp\",\"minHeight\":\"15.00vp\",\"maxWidth\":\"20.00vp\",\"maxHeight\":\"30.00vp\"}");
      console.info('[common_constraintSize] END');
      done();
    });

    /**
     * @tc.number common_0029
     * @tc.name Test the properties of components
     * @tc.desc Set useEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_useEffect', 0, async (done: Function) => {
      console.info('[common_useEffect] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_useEffect] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.useEffect).assertEqual('true');
      console.info('[common_useEffect] END');
      done();
    });

    /**
     * @tc.number common_0030
     * @tc.name Test the properties of components
     * @tc.desc Set sphericalEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_sphericalEffect', 0, async (done: Function) => {
      console.info('[common_sphericalEffect] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_sphericalEffect] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.sphericalEffect).assertEqual(1);
      console.info('[common_sphericalEffect] END');
      done();
    });

    /**
     * @tc.number common_0031
     * @tc.name Test the properties of components
     * @tc.desc Set hitTestBehavior values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_hitTestBehavior', 0, async (done: Function) => {
      console.info('[common_hitTestBehavior] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_hitTestBehavior] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.hitTestBehavior).assertEqual('HitTestMode.Default');
      console.info('[common_hitTestBehavior] END');
      done();
    });


    /**
     * @tc.number common_0032
     * @tc.name Test the properties of components
     * @tc.desc Set lightUpEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_lightUpEffect', 0, async (done: Function) => {
      console.info('[common_lightUpEffect] START');
      let strJson = getInspectorByKey('textModifier3');

      console.info("[common_lightUpEffect] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.lightUpEffect).assertEqual(1);
      console.info('[common_lightUpEffect] END');
      done();
    });

    /**
     * @tc.number common_0033
     * @tc.name Test the properties of components
     * @tc.desc Set width values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_width', 0, async (done: Function) => {
      console.info('[common_width] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_width] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.width).assertEqual("144.00vp");
      console.info('[common_width] END');
      done();
    });

    /**
     * @tc.number common_0034
     * @tc.name Test the properties of components
     * @tc.desc Set height values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_height', 0, async (done: Function) => {
      console.info('[common_height] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_height] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.height).assertEqual("144.00vp");
      console.info('[common_height] END');
      done();
    });

    /**
     * @tc.number common_0035
     * @tc.name Test the properties of components
     * @tc.desc Set expandSafeArea values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_expandSafeArea', 0, async (done: Function) => {
      console.info('[common_expandSafeArea] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_expandSafeArea] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.expandSafeArea).assertEqual(undefined);
      console.info('[common_expandSafeArea] END');
      done();
    });

    /**
     * @tc.number common_0036
     * @tc.name Test the properties of components
     * @tc.desc Set responseRegion values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_responseRegion', 0, async (done: Function) => {
      console.info('[common_responseRegion] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_responseRegion] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.responseRegion[0])
        .assertEqual("{\"x\":\"0.00vp\",\"y\":\"0.00vp\",\"width\":\"50.00%\",\"height\":\"100.00%\"}");
      console.info('[common_responseRegion] END');
      done();
    });

    /**
     * @tc.number common_0037
     * @tc.name Test the properties of components
     * @tc.desc Set visibility values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_visibility', 0, async (done: Function) => {
      console.info('[common_visibility] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_visibility] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('[common_visibility] END');
      done();
    });

    /**
     * @tc.number common_0038
     * @tc.name Test the properties of components
     * @tc.desc Set opacity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_opacity', 0, async (done: Function) => {
      console.info('[common_opacity] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_opacity] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info('[common_opacity] END');
      done();
    });

    /**
     * @tc.number common_0039
     * @tc.name Test the properties of components
     * @tc.desc Set margin values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_margin', 0, async (done: Function) => {
      console.info('[common_margin] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_margin] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.margin).assertEqual("20.00vp");
      console.info('[common_margin] END');
      done();
    });

    /**
     * @tc.number common_0040
     * @tc.name Test the properties of components
     * @tc.desc Set padding values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_padding', 0, async (done: Function) => {
      console.info('[common_padding] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_padding] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("1.00vp");
      console.info('[common_padding] END');
      done();
    });

    /**
     * @tc.number common_0041
     * @tc.name Test the properties of components
     * @tc.desc Set backgroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_backgroundColor', 0, async (done: Function) => {
      console.info('[common_backgroundColor] START');
      let strJson = getInspectorByKey('buttonModifier2');

      console.info("[common_backgroundColor] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FFFF0000");
      console.info('[common_backgroundColor] END');
      done();
    });

    /**
     * @tc.number common_0042
     * @tc.name Test the properties of components
     * @tc.desc Set linearGradient values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_linearGradient', 0, async (done: Function) => {
      console.info('[common_linearGradient] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_linearGradient] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.linearGradient.direction).assertEqual("GradientDirection.Left");
      console.info('[common_linearGradient] END');
      done();
    });

    /**
     * @tc.number common_0043
     * @tc.name Test the properties of components
     * @tc.desc Set linearGradientBlur values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_linearGradientBlur', 0, async (done: Function) => {
      console.info('[common_linearGradientBlur] START');
      let strJson = getInspectorByKey('imageModifier');

      console.info("[common_linearGradientBlur] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.linearGradientBlur.value).assertEqual('60.00px');
      console.info('[common_linearGradientBlur] END');
      done();
    });

    /**
     * @tc.number common_0044
     * @tc.name Test the properties of components
     * @tc.desc Set blendMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_blendMode', 0, async (done: Function) => {
      console.info('[common_blendMode] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_blendMode] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.blendMode).assertEqual(16);
      console.info('[common_blendMode] END');
      done();
    });
    /**
     * @tc.number common_0045
     * @tc.name Test the properties of components
     * @tc.desc Set accessibilityLevel values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_accessibilityLevel', 0, async (done: Function) => {
      console.info('[common_accessibilityLevel] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityLevel] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityLevel).assertEqual("auto");
      console.info('[common_accessibilityLevel] END');
      done();
    });
    /**
     * @tc.number common_0046
     * @tc.name Test the properties of components
     * @tc.desc Set accessibilityDescription values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_accessibilityDescription', 0, async (done: Function) => {
      console.info('[common_accessibilityDescription] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityDescription] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityDescription).assertEqual("");
      console.info('[common_accessibilityDescription] END');
      done();
    });

    /**
     * @tc.number common_0047
     * @tc.name Test the properties of components
     * @tc.desc Set accessibilityText values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_accessibilityText', 0, async (done: Function) => {
      console.info('[common_accessibilityText] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityText] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityText).assertEqual("");
      console.info('[common_accessibilityText] END');
      done();
    });

    /**
     * @tc.number common_0048
     * @tc.name Test the properties of components
     * @tc.desc Set accessibilityGroup values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_accessibilityGroup', 0, async (done: Function) => {
      console.info('[common_accessibilityGroup] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_accessibilityGroup] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson)
        .$attrs));
      expect(JSON.parse(strJson).$attrs.accessibilityGroup).assertEqual(false);
      console.info('[common_accessibilityGroup] END');
      done();
    });

    /**
     * @tc.number common_0049
     * @tc.name Test the properties of components
     * @tc.desc Set restoreId values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_restoreId', 0, async (done: Function) => {
      console.info('[common_restoreId] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_restoreId] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.restoreId).assertEqual(undefined);
      console.info('[common_restoreId] END');
      done();
    });

    /**
     * @tc.number common_0050
     * @tc.name Test the properties of components
     * @tc.desc Set allowDrop values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_allowDrop', 0, async (done: Function) => {
      console.info('[common_allowDrop] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_allowDrop] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.allowDrop).assertEqual(undefined);
      console.info('[common_allowDrop] END');
      done();
    });

    /**
     * @tc.number common_0051
     * @tc.name Test the properties of components
     * @tc.desc Set alignRules values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_alignRules', 0, async (done: Function) => {
      console.info('[common_alignRules] START');
      let strJson = getInspectorByKey('rowModifier');

      console.info("[common_alignRules] JSON.parse(strJson) is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.alignRules).assertEqual(undefined);
      console.info('[common_alignRules] END');
      done();
    });

    /**
     * @tc.number common_0052
     * @tc.name Test the properties of components
     * @tc.desc Set foregroundBlurStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('common_foregroundBlurStyle', 0, async (done: Function) => {
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
