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

export default function scrollerNullUndefined() {
  describe('scrollerNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollerNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollDefault/scrollerNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("scrollerNullUndefined" == pages.name)) {
          console.info("get scrollerNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollerNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollerNullUndefined page error:" + err);
      }
      console.info("scrollerNullUndefined beforeEach end");
      done();
    });

    // ========== scrollPage tests ==========
    /**
     * @tc.name   scrollPageNullUndefined_0100
     * @tc.number scrollPageNullUndefined_0100
     * @tc.desc   Test scroller scrollPage property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollPageNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollPageNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollPage_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollPageNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollPageNullUndefined_0100] scroll.top = ${scroll.top}`);
      console.info(`[scrollPageNullUndefined_0100] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollPageNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollPageNullUndefined_0200
     * @tc.number scrollPageNullUndefined_0200
     * @tc.desc   Test scroller scrollPage property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollPageNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollPageNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollPage_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollPageNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollPageNullUndefined_0200] scroll.top = ${scroll.top}`);
      console.info(`[scrollPageNullUndefined_0200] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollPageNullUndefined_0200] END');
    })

    // ========== scrollTo tests ==========
    /**
     * @tc.name   scrollToNullUndefined_0100
     * @tc.number scrollToNullUndefined_0100
     * @tc.desc   Test scroller scrollTo property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollToNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollToNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollTo_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollToNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollToNullUndefined_0100] scroll.top = ${scroll.top}`);
      console.info(`[scrollToNullUndefined_0100] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollToNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollToNullUndefined_0200
     * @tc.number scrollToNullUndefined_0200
     * @tc.desc   Test scroller scrollTo property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollToNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollToNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollTo_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollToNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollToNullUndefined_0200] scroll.top = ${scroll.top}`);
      console.info(`[scrollToNullUndefined_0200] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollToNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollToNullUndefined_0300
     * @tc.number scrollToNullUndefined_0300
     * @tc.desc   Test xOffset with empty string, animation:canOverScroll with false, canOverScroll with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollToNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollToNullUndefined_0300] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollTo_nullUndefined_3'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollToNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollToNullUndefined_0300] scroll.top = ${scroll.top}`);
      console.info(`[scrollToNullUndefined_0300] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollToNullUndefined_0300] END');
    })

    // ========== scrollEdge tests ==========
    /**
     * @tc.name   scrollEdgeNullUndefined_0100
     * @tc.number scrollEdgeNullUndefined_0100
     * @tc.desc   Test scroller scrollEdge property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollEdgeNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollEdge_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEdgeNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollEdgeNullUndefined_0100] scroll.top = ${scroll.top}`);
      console.info(`[scrollEdgeNullUndefined_0100] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollEdgeNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollEdgeNullUndefined_0200
     * @tc.number scrollEdgeNullUndefined_0200
     * @tc.desc   Test scroller scrollEdge property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollEdgeNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollEdge_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEdgeNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollEdgeNullUndefined_0200] scroll.top = ${scroll.top}`);
      console.info(`[scrollEdgeNullUndefined_0200] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollEdgeNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollEdgeNullUndefined_0300
     * @tc.number scrollEdgeNullUndefined_0300
     * @tc.desc   Test scroller scrollEdge velocity property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollEdgeNullUndefined_0300] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollEdge_nullUndefined_3'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEdgeNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_20');
      console.info(`[scrollEdgeNullUndefined_0300] scroll.bottom = ${scroll.bottom}`);
      console.info(`[scrollEdgeNullUndefined_0300] scrollItem1.bottom = ${scrollItem1.bottom}`);
      expect(Math.floor(Math.abs(scrollItem1.bottom - scroll.bottom)) <= 1).assertTrue();
      console.info('[scrollEdgeNullUndefined_0300] END');
    })

    /**
     * @tc.name   scrollEdgeNullUndefined_0400
     * @tc.number scrollEdgeNullUndefined_0400
     * @tc.desc   Test scroller scrollEdge velocity property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[scrollEdgeNullUndefined_0400] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollEdge_nullUndefined_4'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEdgeNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollEdgeNullUndefined_0400] scroll.top = ${scroll.top}`);
      console.info(`[scrollEdgeNullUndefined_0400] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollEdgeNullUndefined_0400] END');
    })

    // ========== scrollToIndex tests ==========
    /**
     * @tc.name   scrollToIndexNullUndefined_0100
     * @tc.number scrollToIndexNullUndefined_0100
     * @tc.desc   Test scroller scrollToIndex value property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollToIndexNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollToIndexNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollToIndex_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollToIndexNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollToIndexNullUndefined_0100] scroll.top = ${scroll.top}`);
      console.info(`[scrollToIndexNullUndefined_0100] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollToIndexNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollToIndexNullUndefined_0200
     * @tc.number scrollToIndexNullUndefined_0200
     * @tc.desc   Test scroller scrollToIndex value property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollToIndexNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollToIndexNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollToIndex_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollToIndexNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollToIndexNullUndefined_0200] scroll.top = ${scroll.top}`);
      console.info(`[scrollToIndexNullUndefined_0200] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollToIndexNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollToIndexNullUndefined_0300
     * @tc.number scrollToIndexNullUndefined_0300
     * @tc.desc   Test scroller scrollToIndex options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollToIndexNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollToIndexNullUndefined_0300] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollToIndex_nullUndefined_3'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollToIndexNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollToIndexNullUndefined_0300] scroll.top = ${scroll.top}`);
      console.info(`[scrollToIndexNullUndefined_0300] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollToIndexNullUndefined_0300] END');
    })

    /**
     * @tc.name   scrollToIndexNullUndefined_0400
     * @tc.number scrollToIndexNullUndefined_0400
     * @tc.desc   Test scroller scrollToIndex options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollToIndexNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[scrollToIndexNullUndefined_0400] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollToIndex_nullUndefined_4'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollToIndexNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollToIndexNullUndefined_0400] scroll.top = ${scroll.top}`);
      console.info(`[scrollToIndexNullUndefined_0400] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollToIndexNullUndefined_0400] END');
    })


    // ========== scrollBy tests ==========
    /**
     * @tc.name   scrollByNullUndefined_0100
     * @tc.number scrollByNullUndefined_0100
     * @tc.desc   Test scroller scrollBy dx property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollByNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollByNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollBy_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollByNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollByNullUndefined_0100] scroll.top = ${scroll.top}`);
      console.info(`[scrollByNullUndefined_0100] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollByNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollByNullUndefined_0200
     * @tc.number scrollByNullUndefined_0200
     * @tc.desc   Test scroller scrollBy dx property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollByNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollByNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollBy_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollByNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollByNullUndefined_0200] scroll.top = ${scroll.top}`);
      console.info(`[scrollByNullUndefined_0200] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollByNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollByNullUndefined_0300
     * @tc.number scrollByNullUndefined_0300
     * @tc.desc   Test scroller scrollBy dy property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollByNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollByNullUndefined_0300] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollBy_nullUndefined_3'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollByNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollByNullUndefined_0300] scroll.top = ${scroll.top}`);
      console.info(`[scrollByNullUndefined_0300] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollByNullUndefined_0300] END');
    })

    /**
     * @tc.name   scrollByNullUndefined_0400
     * @tc.number scrollByNullUndefined_0400
     * @tc.desc   Test scroller scrollBy dy property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollByNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[scrollByNullUndefined_0400] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('scrollBy_nullUndefined_4'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      let strJson: string = getInspectorByKey('scroller_nullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollByNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual("Scroll");

      let scroll = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined');
      let scrollItem1 = CommonFunc.getComponentRectOnScreen('scroller_nullUndefined_1');
      console.info(`[scrollByNullUndefined_0400] scroll.top = ${scroll.top}`);
      console.info(`[scrollByNullUndefined_0400] scrollItem1.top = ${scrollItem1.top}`);
      expect(Math.floor(Math.abs(scrollItem1.top - scroll.top)) <= 1).assertTrue();
      console.info('[scrollByNullUndefined_0400] END');
    })

    // ========== getItemIndex tests ==========
    /**
     * @tc.name   getItemIndexNullUndefined_0100
     * @tc.number getItemIndexNullUndefined_0100
     * @tc.desc   Test scroller getItemIndex x property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemIndexNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[getItemIndexNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemIndex_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemIndexNullUndefined_0100 getValue: ', AppStorage.get('getItemIndex_x_null'))
      expect(AppStorage.get('getItemIndex_x_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemIndex_x_null')
      console.info('[getItemIndexNullUndefined_0100] END');
    })

    /**
     * @tc.name   getItemIndexNullUndefined_0200
     * @tc.number getItemIndexNullUndefined_0200
     * @tc.desc   Test scroller getItemIndex x property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemIndexNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[getItemIndexNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemIndex_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemIndexNullUndefined_0200 getValue: ', AppStorage.get('getItemIndex_x_undefined'))
      expect(AppStorage.get('getItemIndex_x_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemIndex_x_undefined')
      console.info('[getItemIndexNullUndefined_0200] END');
    })

    /**
     * @tc.name   getItemIndexNullUndefined_0300
     * @tc.number getItemIndexNullUndefined_0300
     * @tc.desc   Test scroller getItemIndex y property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemIndexNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[getItemIndexNullUndefined_0300] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemIndex_nullUndefined_3'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemIndexNullUndefined_0300 getValue: ', AppStorage.get('getItemIndex_y_null'))
      expect(AppStorage.get('getItemIndex_y_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemIndex_y_null')
      console.info('[getItemIndexNullUndefined_0300] END');
    })

    /**
     * @tc.name   getItemIndexNullUndefined_0400
     * @tc.number getItemIndexNullUndefined_0400
     * @tc.desc   Test scroller getItemIndex y property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemIndexNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[getItemIndexNullUndefined_0400] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemIndex_nullUndefined_4'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemIndexNullUndefined_0400 getValue: ', AppStorage.get('getItemIndex_y_undefined'))
      expect(AppStorage.get('getItemIndex_y_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemIndex_y_undefined')
      console.info('[getItemIndexNullUndefined_0400] END');
    })

    // ========== getItemRect tests ==========
    /**
     * @tc.name   getItemRectNullUndefined_0100
     * @tc.number getItemRectNullUndefined_0100
     * @tc.desc   Test scroller getItemRect property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemRectNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[getItemRectNullUndefined_0100] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemRect_nullUndefined_1'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemRectNullUndefined_0100 getValue: ', AppStorage.get('getItemRect_null'))
      expect(AppStorage.get('getItemRect_null')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemRect_null')
      console.info('[getItemRectNullUndefined_0100] END');
    })

    /**
     * @tc.name   getItemRectNullUndefined_0200
     * @tc.number getItemRectNullUndefined_0200
     * @tc.desc   Test scroller getItemRect property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getItemRectNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[getItemRectNullUndefined_0200] START');
      let driver = Driver.create();
      let scrollerBtn = await driver.findComponent(ON.id('getItemRect_nullUndefined_2'));
      await scrollerBtn.click();
      await CommonFunc.sleep(1500);

      console.log('getItemRectNullUndefined_0200 getValue: ', AppStorage.get('getItemRect_undefined'))
      expect(AppStorage.get('getItemRect_undefined')).assertEqual("401");
      await CommonFunc.sleep(500);
      AppStorage.delete('getItemRect_undefined')
      console.info('[getItemRectNullUndefined_0200] END');
    })
  })
}
