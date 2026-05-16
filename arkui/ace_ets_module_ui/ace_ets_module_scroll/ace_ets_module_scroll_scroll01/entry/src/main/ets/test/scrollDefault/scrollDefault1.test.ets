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
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollDefaultTest1() {
  describe('scrollDefaultTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollDefaultTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollDefault/scrollDefault1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("scrollDefault1" == pages.name)) {
          console.info("get scrollDefaultTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollDefaultTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollDefaultTest1 page error:" + err);
      }
      console.info("scrollDefaultTest1 beforeEach end");
      done();
    });

    // ========== scrollable tests (ScrollDirection) ==========
    /**
     * @tc.name   scrollScrollableNullUndefined_0100
     * @tc.number scrollScrollableNullUndefined_0100
     * @tc.desc   Test Scroll scrollable property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollableNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollScrollableNullUndefined_0100] START');

      let strJson: string = getInspectorByKey('scroll_scrollable_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollableNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.scrollable));

      // Scroll scrollable 不设置
      expect(obj.$attrs.scrollable).assertEqual("ScrollDirection.Vertical");
      console.info('[scrollScrollableNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollScrollableNullUndefined_0200
     * @tc.number scrollScrollableNullUndefined_0200
     * @tc.desc   Test Scroll scrollable property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollableNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollScrollableNullUndefined_0200] START');

      let strJson: string = getInspectorByKey('scroll_scrollable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollableNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.scrollable));

      // Scroll scrollable 设置null
      expect(obj.$attrs.scrollable).assertEqual("ScrollDirection.Vertical");
      console.info('[scrollScrollableNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollScrollableNullUndefined_0300
     * @tc.number scrollScrollableNullUndefined_0300
     * @tc.desc   Test Scroll scrollable property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollableNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollScrollableNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('scroll_scrollable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollableNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.scrollable));

      // Scroll scrollable 设置undefined
      expect(obj.$attrs.scrollable).assertEqual("ScrollDirection.Vertical");
      console.info('[scrollScrollableNullUndefined_0300] END');
    })

    // ========== maxZoomScale tests (number) ==========
    /**
     * @tc.name   scrollMaxZoomScaleNullUndefined_0100
     * @tc.number scrollMaxZoomScaleNullUndefined_0100
     * @tc.desc   Test Scroll maxZoomScale property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollMaxZoomScaleNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollMaxZoomScaleNullUndefined_0100] START');

      let strJson: string = getInspectorByKey('scroll_maxZoomScale_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollMaxZoomScaleNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.maxZoomScale));

      // Scroll maxZoomScale 不设置
      expect(obj.$attrs.maxZoomScale).assertEqual(1);
      console.info('[scrollMaxZoomScaleNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollMaxZoomScaleNullUndefined_0200
     * @tc.number scrollMaxZoomScaleNullUndefined_0200
     * @tc.desc   Test Scroll maxZoomScale property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollMaxZoomScaleNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollMaxZoomScaleNullUndefined_0200] START');

      let strJson: string = getInspectorByKey('scroll_maxZoomScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollMaxZoomScaleNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.maxZoomScale));

      // Scroll maxZoomScale 设置null
      expect(obj.$attrs.maxZoomScale).assertEqual(1);
      console.info('[scrollMaxZoomScaleNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollMaxZoomScaleNullUndefined_0300
     * @tc.number scrollMaxZoomScaleNullUndefined_0300
     * @tc.desc   Test Scroll maxZoomScale property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollMaxZoomScaleNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollMaxZoomScaleNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('scroll_maxZoomScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollMaxZoomScaleNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.maxZoomScale));

      // Scroll maxZoomScale 设置undefined
      expect(obj.$attrs.maxZoomScale).assertEqual(1);
      console.info('[scrollMaxZoomScaleNullUndefined_0300] END');
    })

    // ========== minZoomScale tests (number) ==========
    /**
     * @tc.name   scrollMinZoomScaleNullUndefined_0100
     * @tc.number scrollMinZoomScaleNullUndefined_0100
     * @tc.desc   Test Scroll minZoomScale property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollMinZoomScaleNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollMinZoomScaleNullUndefined_0100] START');

      let strJson: string = getInspectorByKey('scroll_minZoomScale_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollMinZoomScaleNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.minZoomScale));

      // Scroll minZoomScale 不设置
      expect(obj.$attrs.minZoomScale).assertEqual(1);
      console.info('[scrollMinZoomScaleNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollMinZoomScaleNullUndefined_0200
     * @tc.number scrollMinZoomScaleNullUndefined_0200
     * @tc.desc   Test Scroll minZoomScale property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollMinZoomScaleNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollMinZoomScaleNullUndefined_0200] START');

      let strJson: string = getInspectorByKey('scroll_minZoomScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollMinZoomScaleNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.minZoomScale));

      // Scroll minZoomScale 设置null
      expect(obj.$attrs.minZoomScale).assertEqual(1);
      console.info('[scrollMinZoomScaleNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollMinZoomScaleNullUndefined_0300
     * @tc.number scrollMinZoomScaleNullUndefined_0300
     * @tc.desc   Test Scroll minZoomScale property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollMinZoomScaleNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollMinZoomScaleNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('scroll_minZoomScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollMinZoomScaleNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.minZoomScale));

      // Scroll minZoomScale 设置undefined
      expect(obj.$attrs.minZoomScale).assertEqual(1);
      console.info('[scrollMinZoomScaleNullUndefined_0300] END');
    })

    // ========== zoomScale tests (number) ==========
    /**
     * @tc.name   scrollZoomScaleNullUndefined_0100
     * @tc.number scrollZoomScaleNullUndefined_0100
     * @tc.desc   Test Scroll zoomScale property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollZoomScaleNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollZoomScaleNullUndefined_0100] START');

      let strJson: string = getInspectorByKey('scroll_zoomScale_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollZoomScaleNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.zoomScale));

      // Scroll zoomScale 不设置
      expect(obj.$attrs.zoomScale).assertEqual(1);
      console.info('[scrollZoomScaleNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollZoomScaleNullUndefined_0200
     * @tc.number scrollZoomScaleNullUndefined_0200
     * @tc.desc   Test Scroll zoomScale property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollZoomScaleNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollZoomScaleNullUndefined_0200] START');

      let strJson: string = getInspectorByKey('scroll_zoomScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollZoomScaleNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.zoomScale));

      // Scroll zoomScale 设置null
      expect(obj.$attrs.zoomScale).assertEqual(1);
      console.info('[scrollZoomScaleNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollZoomScaleNullUndefined_0300
     * @tc.number scrollZoomScaleNullUndefined_0300
     * @tc.desc   Test Scroll zoomScale property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollZoomScaleNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollZoomScaleNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('scroll_zoomScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollZoomScaleNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.zoomScale));

      // Scroll zoomScale 设置undefined
      expect(obj.$attrs.zoomScale).assertEqual(1);
      console.info('[scrollZoomScaleNullUndefined_0300] END');
    })

    // ========== enableBouncesZoom tests (number) ==========
    /**
     * @tc.name   scrollEnableBouncesZoomNullUndefined_0100
     * @tc.number scrollEnableBouncesZoomNullUndefined_0100
     * @tc.desc   Test Scroll enableBouncesZoom property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnableBouncesZoomNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollEnableBouncesZoomNullUndefined_0100] START');

      let strJson: string = getInspectorByKey('scroll_enableBouncesZoom_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEnableBouncesZoomNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.enableBouncesZoom));

      // Scroll enableBouncesZoom 不设置
      expect(obj.$attrs.enableBouncesZoom).assertEqual(true);
      console.info('[scrollEnableBouncesZoomNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollEnableBouncesZoomNullUndefined_0200
     * @tc.number scrollEnableBouncesZoomNullUndefined_0200
     * @tc.desc   Test Scroll enableBouncesZoom property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnableBouncesZoomNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollEnableBouncesZoomNullUndefined_0200] START');

      let strJson: string = getInspectorByKey('scroll_enableBouncesZoom_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEnableBouncesZoomNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.enableBouncesZoom));

      // Scroll enableBouncesZoom 设置null
      expect(obj.$attrs.enableBouncesZoom).assertEqual(true);
      console.info('[scrollEnableBouncesZoomNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollEnableBouncesZoomNullUndefined_0300
     * @tc.number scrollEnableBouncesZoomNullUndefined_0300
     * @tc.desc   Test Scroll enableBouncesZoom property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnableBouncesZoomNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollEnableBouncesZoomNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('scroll_enableBouncesZoom_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEnableBouncesZoomNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.enableBouncesZoom));

      // Scroll enableBouncesZoom 设置undefined
      expect(obj.$attrs.enableBouncesZoom).assertEqual(true);
      console.info('[scrollEnableBouncesZoomNullUndefined_0300] END');
    })

    // ========== scrollBar tests ==========
    /**
     * @tc.name   scrollScrollBarNullUndefined_0100
     * @tc.number SUB_ARKUI_scroll_SCROLLBAR_NULL_0100
     * @tc.desc   Test scroll scrollBar property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scroll_scrollBar_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.scrollBar));

      // scroll scrollBar 不设置，默认值Auto
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[scrollScrollBarNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollScrollBarNullUndefined_0200
     * @tc.number SUB_ARKUI_scroll_SCROLLBAR_NULL_0200
     * @tc.desc   Test scroll scrollBar property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('scroll_scrollBar_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.scrollBar));

      // scroll scrollBar 设置null
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[scrollScrollBarNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollScrollBarNullUndefined_0300
     * @tc.number SUB_ARKUI_scroll_SCROLLBAR_NULL_0300
     * @tc.desc   Test scroll scrollBar property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_scrollBar_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.scrollBar));

      // scroll scrollBar 设置undefined
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[scrollScrollBarNullUndefined_0300] END');
    })

    // ========== scrollBarColor tests (Color|number|string) ==========
    /**
     * @tc.name   scrollScrollBarColorNullUndefined_0100
     * @tc.number SUB_ARKUI_scroll_SCROLLBARCOLOR_NULL_0100
     * @tc.desc   Test scroll scrollBarColor property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarColorNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarColorNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('scroll_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollBarColor_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarColorNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarColorNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[scrollScrollBarColorNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[scrollScrollBarColorNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollScrollBarColorNullUndefined_0200
     * @tc.number SUB_ARKUI_scroll_SCROLLBARCOLOR_NULL_0200
     * @tc.desc   Test scroll scrollBarColor property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarColorNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarColorNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('scroll_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollBarColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarColorNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarColorNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[scrollScrollBarColorNullUndefined_0200] empty obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // scroll scrollBarColor 设置null
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[scrollScrollBarColorNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollScrollBarColorNullUndefined_0300
     * @tc.number SUB_ARKUI_scroll_SCROLLBARCOLOR_NULL_0300
     * @tc.desc   Test scroll scrollBarColor property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarColorNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarColorNullUndefined_0300] START');
      let strJsonCompare: string = getInspectorByKey('scroll_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollBarColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarColorNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarColorNullUndefined_0300] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[scrollScrollBarColorNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // scroll scrollBarColor 设置undefined
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[scrollScrollBarColorNullUndefined_0300] END');
    })

    /**
     * @tc.name   scrollScrollBarColorNullUndefined_0400
     * @tc.number scrollScrollBarColorNullUndefined_0400
     * @tc.desc   Test scroll scrollBarColor property with number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarColorNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarColorNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('scroll_scrollBarColor_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarColorNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarColorNullUndefined_0400] number is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // scroll scrollBarColor 设置number
      expect(obj.$attrs.scrollBarColor).assertEqual("#FFFFF000");
      console.info('[scrollScrollBarColorNullUndefined_0400] END');
    })

    // ========== scrollBarWidth tests (number|string) ==========
    /**
     * @tc.name   scrollScrollBarWidthNullUndefined_0100
     * @tc.number SUB_ARKUI_scroll_SCROLLBARWIDTH_NULL_0100
     * @tc.desc   Test scroll scrollBarWidth property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarWidthNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarWidthNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scroll_scrollBarWidth_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarWidthNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarWidthNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // scroll scrollBarWidth 不设置
      expect(obj.$attrs.scrollBarWidth).assertEqual("4.00vp");
      console.info('[scrollScrollBarWidthNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollScrollBarWidthNullUndefined_0200
     * @tc.number SUB_ARKUI_scroll_SCROLLBARWIDTH_NULL_0200
     * @tc.desc   Test scroll scrollBarWidth property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarWidthNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarWidthNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('scroll_scrollBarWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollBarWidth_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarWidthNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarWidthNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarWidth));
      console.info("[scrollScrollBarWidthNullUndefined_0200] empty obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.scrollBarWidth).assertEqual(objCompare.$attrs.scrollBarWidth);
      console.info('[scrollScrollBarWidthNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollScrollBarWidthNullUndefined_0300
     * @tc.number SUB_ARKUI_scroll_SCROLLBARWIDTH_NULL_0300
     * @tc.desc   Test scroll scrollBarWidth property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarWidthNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarWidthNullUndefined_0300] START');
      let strJsonCompare: string = getInspectorByKey('scroll_scrollBarWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollBarWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarWidthNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarWidthNullUndefined_0300] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarWidth));
      console.info("[scrollScrollBarWidthNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // scroll scrollBarWidth 设置null
      expect(obj.$attrs.scrollBarWidth).assertEqual(objCompare.$attrs.scrollBarWidth);
      console.info('[scrollScrollBarWidthNullUndefined_0300] END');
    })

    /**
     * @tc.name   scrollScrollBarWidthNullUndefined_0400
     * @tc.number SUB_ARKUI_scroll_SCROLLBARWIDTH_NULL_0400
     * @tc.desc   Test scroll scrollBarWidth property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarWidthNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarWidthNullUndefined_0400] START');
      let strJsonCompare: string = getInspectorByKey('scroll_scrollBarWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollBarWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollScrollBarWidthNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[scrollScrollBarWidthNullUndefined_0400] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarWidth));
      console.info("[scrollScrollBarWidthNullUndefined_0400] undefined obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // scroll scrollBarWidth 设置undefined
      expect(obj.$attrs.scrollBarWidth).assertEqual(objCompare.$attrs.scrollBarWidth);
      console.info('[scrollScrollBarWidthNullUndefined_0400] END');
    })
  })
}