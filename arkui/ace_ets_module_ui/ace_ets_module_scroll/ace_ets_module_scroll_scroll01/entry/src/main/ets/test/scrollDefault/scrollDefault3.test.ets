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

export default function scrollDefaultTest3() {
  describe('scrollDefaultTest3', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollDefaultTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollDefault/scrollDefault3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("scrollDefault3" == pages.name)) {
          console.info("get scrollDefaultTest3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollDefaultTest3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollDefaultTest3 page error:" + err);
      }
      console.info("scrollDefaultTest3 beforeEach end");
      done();
    });

    // ========== scrollBarMargin tests ==========
    /**
     * @tc.name   scrollScrollBarMarginNullUndefined_0100
     * @tc.number scrollScrollBarMarginNullUndefined_0100
     * @tc.desc   Test Scroll scrollBarMargin property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarMarginNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarMarginNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scroll_scrollBarMargin_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollScrollBarMarginNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.scrollBarMargin));

      // Scroll scrollBarMargin 不设置:
      expect(obj.$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.00px, end: 0.00px");
      console.info('[scrollScrollBarMarginNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollScrollBarMarginNullUndefined_0200
     * @tc.number scrollScrollBarMarginNullUndefined_0200
     * @tc.desc   Test Scroll scrollBarMargin property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarMarginNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarMarginNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('scroll_scrollBarMargin_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollScrollBarMarginNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.scrollBarMargin));

      // Scroll scrollBarMargin 设置null:
      expect(obj.$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.00px, end: 0.00px");
      console.info('[scrollScrollBarMarginNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollScrollBarMarginNullUndefined_0300
     * @tc.number scrollScrollBarMarginNullUndefined_0300
     * @tc.desc   Test Scroll scrollBarMargin property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollScrollBarMarginNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollScrollBarMarginNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_scrollBarMargin_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollScrollBarMarginNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.scrollBarMargin));

      // Scroll scrollBarMargin 设置undefined:
      expect(obj.$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.00px, end: 0.00px");
      console.info('[scrollScrollBarMarginNullUndefined_0300] END');
    })

    // ========== fadingEdge tests ==========
    /**
     * @tc.name   scrollFadingEdgeNullUndefined_0100
     * @tc.number scrollFadingEdgeNullUndefined_0100
     * @tc.desc   Test Scroll fadingEdge property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFadingEdgeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollFadingEdgeNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scroll_fadingEdge_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollFadingEdgeNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.fadingEdge));

      // Scroll fadingEdge 设置null
      expect(obj.$attrs.fadingEdge).assertEqual(false);
      console.info('[scrollFadingEdgeNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollFadingEdgeNullUndefined_0200
     * @tc.number scrollFadingEdgeNullUndefined_0200
     * @tc.desc   Test list fadingEdge property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFadingEdgeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollFadingEdgeNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('scroll_fadingEdge_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollFadingEdgeNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.fadingEdge));

      // Scroll fadingEdge 设置undefined
      expect(obj.$attrs.fadingEdge).assertEqual(false);
      console.info('[scrollFadingEdgeNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollFadingEdgeNullUndefined_0300
     * @tc.number scrollFadingEdgeNullUndefined_0300
     * @tc.desc   Test list fadingEdge options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFadingEdgeNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollFadingEdgeNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_fadingEdge_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollFadingEdgeNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.fadingEdge));

      // Scroll fadingEdge options 设置null
      expect(obj.$attrs.fadingEdge).assertEqual(true);
      console.info('[scrollFadingEdgeNullUndefined_0300] END');
    })

    /**
     * @tc.name   scrollFadingEdgeNullUndefined_0400
     * @tc.number scrollFadingEdgeNullUndefined_0400
     * @tc.desc   Test list fadingEdge options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFadingEdgeNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[scrollFadingEdgeNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('scroll_fadingEdge_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollFadingEdgeNullUndefined_0400] undefined obj is: " +JSON.stringify(obj.$attrs.fadingEdge));

      // Scroll fadingEdge options 设置undefined
      expect(obj.$attrs.fadingEdge).assertEqual(true);
      console.info('[scrollFadingEdgeNullUndefined_0400] END');
    })

    // ========== flingSpeedLimit tests ==========
    /**
     * @tc.name   scrollFlingSpeedLimitNullUndefined_0100
     * @tc.number scrollFlingSpeedLimitNullUndefined_0100
     * @tc.desc   Test Scroll flingSpeedLimit property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFlingSpeedLimitNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollFlingSpeedLimitNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scroll_flingSpeedLimit_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollFlingSpeedLimitNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.flingSpeedLimit));

      // Scroll flingSpeedLimit 不设置
      expect(obj.$attrs.flingSpeedLimit).assertEqual("9000.00vp");
      console.info('[scrollFlingSpeedLimitNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollFlingSpeedLimitNullUndefined_0200
     * @tc.number scrollFlingSpeedLimitNullUndefined_0200
     * @tc.desc   Test Scroll flingSpeedLimit property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFlingSpeedLimitNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollFlingSpeedLimitNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('scroll_flingSpeedLimit_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollFlingSpeedLimitNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.flingSpeedLimit));

      // Scroll flingSpeedLimit 设置null
      expect(obj.$attrs.flingSpeedLimit).assertEqual("9000.00vp");
      console.info('[scrollFlingSpeedLimitNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollFlingSpeedLimitNullUndefined_0300
     * @tc.number scrollFlingSpeedLimitNullUndefined_0300
     * @tc.desc   Test Scroll flingSpeedLimit property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFlingSpeedLimitNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollFlingSpeedLimitNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_flingSpeedLimit_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollFlingSpeedLimitNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.flingSpeedLimit));

      // Scroll flingSpeedLimit 设置undefined
      expect(obj.$attrs.flingSpeedLimit).assertEqual("9000.00vp");
      console.info('[scrollFlingSpeedLimitNullUndefined_0300] END');
    })

    // ========== clipContent tests ==========
    /**
     * @tc.name   scrollClipContentNullUndefined_0100
     * @tc.number scrollClipContentNullUndefined_0100
     * @tc.desc   Test Scroll clipContent property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollClipContentNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollClipContentNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scroll_clipContent_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollClipContentNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.clipContent));

      // Scroll clipContent 不设置
      expect(obj.$attrs.clipContent).assertEqual("ContentClipMode.BOUNDARY");
      console.info('[scrollClipContentNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollClipContentNullUndefined_0200
     * @tc.number scrollClipContentNullUndefined_0200
     * @tc.desc   Test Scroll clipContent property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollClipContentNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollClipContentNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('scroll_clipContent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollClipContentNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.clipContent));

      // Scroll clipContent 设置null
      expect(obj.$attrs.clipContent).assertEqual("ContentClipMode.BOUNDARY");
      console.info('[scrollClipContentNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollClipContentNullUndefined_0300
     * @tc.number scrollClipContentNullUndefined_0300
     * @tc.desc   Test Scroll clipContent property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollClipContentNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollClipContentNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_clipContent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollClipContentNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.clipContent));

      // Scroll clipContent 设置undefined
      expect(obj.$attrs.clipContent).assertEqual("ContentClipMode.BOUNDARY");
      console.info('[scrollClipContentNullUndefined_0300] END');
    })
  })
}