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

export default function scrollDefaultTest2() {
  describe('scrollDefaultTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollDefaultTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollDefault/scrollDefault2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("scrollDefault2" == pages.name)) {
          console.info("get scrollDefaultTest2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollDefaultTest2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollDefaultTest2 page error:" + err);
      }
      console.info("scrollDefaultTest2 beforeEach end");
      done();
    });

    // ========== edgeEffect tests ==========
    /**
     * @tc.name   scrollEdgeEffectNullUndefined_0100
     * @tc.number scrollEdgeEffectNullUndefined_0100
     * @tc.desc   Test scroll edgeEffect property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeEffectNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollEdgeEffectNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('scroll_edgeEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_edgeEffect_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEdgeEffectNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.edgeEffect));
      console.info("[scrollEdgeEffectNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.edgeEffect));

      // Scroll edgeEffect 设置null
      expect(obj.$attrs.edgeEffect).assertEqual(objCompare.$attrs.edgeEffect);
      console.info('[scrollEdgeEffectNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollEdgeEffectNullUndefined_0200
     * @tc.number scrollEdgeEffectNullUndefined_0200
     * @tc.desc   Test scroll edgeEffect property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeEffectNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollEdgeEffectNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('scroll_edgeEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_edgeEffect_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEdgeEffectNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.edgeEffect));
      console.info("[scrollEdgeEffectNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.edgeEffect));

      // Scroll edgeEffect 设置undefined
      expect(obj.$attrs.edgeEffect).assertEqual(objCompare.$attrs.edgeEffect);
      console.info('[scrollEdgeEffectNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollEdgeEffectNullUndefined_0300
     * @tc.number scrollEdgeEffectNullUndefined_0300
     * @tc.desc   Test Scroll edgeEffect options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeEffectNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollEdgeEffectNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('scroll_edgeEffect_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEdgeEffectNullUndefined_0300] null obj is: " +
      JSON.stringify(obj.$attrs.edgeEffect));

      // Scroll edgeEffect options 设置null
      expect(obj.$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[scrollEdgeEffectNullUndefined_0300] END');
    })

    /**
     * @tc.name   scrollEdgeEffectNullUndefined_0400
     * @tc.number scrollEdgeEffectNullUndefined_0400
     * @tc.desc   Test Scroll edgeEffect options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEdgeEffectNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[scrollEdgeEffectNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('scroll_edgeEffect_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEdgeEffectNullUndefined_0400] undefined obj is: " +
      JSON.stringify(obj.$attrs.edgeEffect));

      // Scroll edgeEffect options 设置undefined
      expect(obj.$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[scrollEdgeEffectNullUndefined_0400] END');
    })

    // ========== nestedScroll tests ==========
    /**
     * @tc.name   scrollNestedScrollNullUndefined_0100
     * @tc.number scrollNestedScrollNullUndefined_0100
     * @tc.desc   Test scroll nestedScroll property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollNestedScrollNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollNestedScrollNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('scroll_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_nestedScroll_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[scrollNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[scrollNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[scrollNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // Scroll nestedScroll 设置null
      expect(JSON.parse(strJsonCompare).$type).assertEqual('Scroll');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);
      console.info('[scrollNestedScrollNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollNestedScrollNullUndefined_0200
     * @tc.number scrollNestedScrollNullUndefined_0200
     * @tc.desc   Test scroll nestedScroll property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollNestedScrollNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollNestedScrollNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('scroll_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_nestedScroll_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollNestedScrollNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[scrollNestedScrollNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[scrollNestedScrollNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[scrollNestedScrollNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // Scroll nestedScroll 设置undefined
      expect(JSON.parse(strJsonCompare).$type).assertEqual('Scroll');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);
      console.info('[scrollNestedScrollNullUndefined_0200] END');
    })

    // ========== enableScrollInteraction tests (boolean) ==========
    /**
     * @tc.name   scrollEnableScrollInteractionNullUndefined_0100
     * @tc.number scrollEnableScrollInteractionNullUndefined_0100
     * @tc.desc   Test scroll enableScrollInteraction property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnableScrollInteractionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollEnableScrollInteractionNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scroll_enableScrollInteraction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEnableScrollInteractionNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // Scroll enableScrollInteraction 设置null
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[scrollEnableScrollInteractionNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollEnableScrollInteractionNullUndefined_0200
     * @tc.number scrollEnableScrollInteractionNullUndefined_0200
     * @tc.desc   Test scroll enableScrollInteraction property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnableScrollInteractionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollEnableScrollInteractionNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('scroll_enableScrollInteraction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEnableScrollInteractionNullUndefined_0200] undefined obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // Scroll enableScrollInteraction 设置undefined
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[scrollEnableScrollInteractionNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollEnableScrollInteractionNullUndefined_0300
     * @tc.number scrollEnableScrollInteractionNullUndefined_0300
     * @tc.desc   Test scroll enableScrollInteraction property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnableScrollInteractionNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollEnableScrollInteractionNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_enableScrollInteraction_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEnableScrollInteractionNullUndefined_0300] false obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // Scroll enableScrollInteraction 设置false
      expect(obj.$attrs.enableScrollInteraction).assertEqual(false);
      console.info('[scrollEnableScrollInteractionNullUndefined_0300] END');
    })

    // ========== friction tests ==========
    /**
     * @tc.name   scrollFrictionNullUndefined_0100
     * @tc.number scrollFrictionNullUndefined_0100
     * @tc.desc   Test scroll friction property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFrictionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollFrictionNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('scroll_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_friction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollFrictionNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[scrollFrictionNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.friction));

      // Scroll friction 设置null
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[scrollFrictionNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollFrictionNullUndefined_0200
     * @tc.number scrollFrictionNullUndefined_0200
     * @tc.desc   Test scroll friction property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollFrictionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollFrictionNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('scroll_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_friction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollFrictionNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[scrollFrictionNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.friction));

      // Scroll friction 设置undefined
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[scrollFrictionNullUndefined_0200] END');
    })

    // ========== scrollSnap tests ==========
    /**
     * @tc.name   scrollscrollSnapNullUndefined_0100
     * @tc.number scrollscrollSnapNullUndefined_0100
     * @tc.desc   Test scroll scrollSnap property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollscrollSnapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollscrollSnapNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('scroll_scrollSnap_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollSnap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollscrollSnapNullUndefined_0100] default snapPagination obj is: " +
      JSON.stringify(objCompare.$attrs.scrollSnap.snapPagination));
      console.info("[scrollscrollSnapNullUndefined_0100] default enableSnapToStart obj is: " +
      JSON.stringify(objCompare.$attrs.scrollSnap.enableSnapToStart));
      console.info("[scrollscrollSnapNullUndefined_0100] default enableSnapToEnd obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.enableSnapToEnd));
      console.info("[scrollscrollSnapNullUndefined_0100] null snapPagination obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.snapPagination));
      console.info("[scrollscrollSnapNullUndefined_0100] null enableSnapToStart obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.enableSnapToStart));
      console.info("[scrollscrollSnapNullUndefined_0100] null enableSnapToEnd obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.enableSnapToEnd));

      // Scroll scrollSnap 设置null,{"snapPagination":"0.00px","enableSnapToStart":true,"enableSnapToEnd":true}
      expect(JSON.parse(strJsonCompare).$type).assertEqual('Scroll');
      expect(obj.$attrs.scrollSnap.snapPagination).assertEqual(objCompare.$attrs.scrollSnap.snapPagination);
      expect(obj.$attrs.scrollSnap.enableSnapToStart).assertEqual(objCompare.$attrs.scrollSnap.enableSnapToStart);
      expect(obj.$attrs.scrollSnap.enableSnapToEnd).assertEqual(objCompare.$attrs.scrollSnap.enableSnapToEnd);
      console.info('[scrollscrollSnapNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollscrollSnapNullUndefined_0200
     * @tc.number scrollscrollSnapNullUndefined_0200
     * @tc.desc   Test scroll scrollSnap property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollscrollSnapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollscrollSnapNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('scroll_scrollSnap_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_scrollSnap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollscrollSnapNullUndefined_0200] default snapPagination obj is: " +
      JSON.stringify(objCompare.$attrs.scrollSnap.snapPagination));
      console.info("[scrollscrollSnapNullUndefined_0200] default enableSnapToStart obj is: " +
      JSON.stringify(objCompare.$attrs.scrollSnap.enableSnapToStart));
      console.info("[scrollscrollSnapNullUndefined_0200] default enableSnapToEnd obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.enableSnapToEnd));
      console.info("[scrollscrollSnapNullUndefined_0200] null snapPagination obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.snapPagination));
      console.info("[scrollscrollSnapNullUndefined_0200] null enableSnapToStart obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.enableSnapToStart));
      console.info("[scrollscrollSnapNullUndefined_0200] null enableSnapToEnd obj is: " +
      JSON.stringify(obj.$attrs.scrollSnap.enableSnapToEnd));

      // Scroll scrollSnap 设置undefined,{"snapPagination":"0.00px","enableSnapToStart":true,"enableSnapToEnd":true}
      expect(JSON.parse(strJsonCompare).$type).assertEqual('Scroll');
      expect(obj.$attrs.scrollSnap.snapPagination).assertEqual(objCompare.$attrs.scrollSnap.snapPagination);
      expect(obj.$attrs.scrollSnap.enableSnapToStart).assertEqual(objCompare.$attrs.scrollSnap.enableSnapToStart);
      expect(obj.$attrs.scrollSnap.enableSnapToEnd).assertEqual(objCompare.$attrs.scrollSnap.enableSnapToEnd);
      console.info('[scrollscrollSnapNullUndefined_0200] END');
    })

    // ========== enablePaging tests (boolean) ==========
    /**
     * @tc.name   scrollEnablePagingNullUndefined_0100
     * @tc.number scrollEnablePagingNullUndefined_0100
     * @tc.desc   Test scroll enablePaging property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnablePagingNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollEnablePagingNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('scroll_enablePaging_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_enablePaging_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEnablePagingNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.enablePaging));
      console.info("[scrollEnablePagingNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.enablePaging));

      // Scroll enablePaging 设置null
      expect(obj.$attrs.enablePaging).assertEqual(objCompare.$attrs.enablePaging);
      console.info('[scrollEnablePagingNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollEnablePagingNullUndefined_0200
     * @tc.number scrollEnablePagingNullUndefined_0200
     * @tc.desc   Test scroll enablePaging property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnablePagingNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollEnablePagingNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('scroll_enablePaging_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scroll_enablePaging_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollEnablePagingNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.enablePaging));
      console.info("[scrollEnablePagingNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.enablePaging));

      // Scroll enablePaging 设置undefined
      expect(obj.$attrs.enablePaging).assertEqual(objCompare.$attrs.enablePaging);
      console.info('[scrollEnablePagingNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollEnablePagingNullUndefined_0300
     * @tc.number scrollEnablePagingNullUndefined_0300
     * @tc.desc   Test scroll enablePaging property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollEnablePagingNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollEnablePagingNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_enablePaging_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollEnablePagingNullUndefined_0300] false obj is: " +
      JSON.stringify(obj.$attrs.enablePaging));

      // Scroll enablePaging 设置false
      expect(obj.$attrs.enablePaging).assertEqual(false);
      console.info('[scrollEnablePagingNullUndefined_0300] END');
    })

    // ========== initialOffset tests ==========
    /**
     * @tc.name   scrollinitialOffsetNullUndefined_0100
     * @tc.number scrollinitialOffsetNullUndefined_0100
     * @tc.desc   Test Scroll initialOffset property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollinitialOffsetNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollinitialOffsetNullUndefined_0100] START');

      let strJson: string = getInspectorByKey('scroll_initialOffset_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollinitialOffsetNullUndefined_0100] default xOffset is: " + JSON.stringify(obj.$attrs.initialOffset.xOffset));
      console.info("[scrollinitialOffsetNullUndefined_0100] default yOffset is: " + JSON.stringify(obj.$attrs.initialOffset.yOffset));

      // Scroll initialOffset 不设置
      expect(obj.$attrs.initialOffset.xOffset).assertEqual("0.00px");
      expect(obj.$attrs.initialOffset.yOffset).assertEqual("0.00px");
      console.info('[scrollinitialOffsetNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollinitialOffsetNullUndefined_0200
     * @tc.number scrollinitialOffsetNullUndefined_0200
     * @tc.desc   Test Scroll initialOffset property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollinitialOffsetNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollinitialOffsetNullUndefined_0200] START');

      let strJson: string = getInspectorByKey('scroll_initialOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollinitialOffsetNullUndefined_0200] default xOffset is: " + JSON.stringify(obj.$attrs.initialOffset.xOffset));
      console.info("[scrollinitialOffsetNullUndefined_0200] default yOffset is: " + JSON.stringify(obj.$attrs.initialOffset.yOffset));

      // Scroll initialOffset 设置null
      expect(obj.$attrs.initialOffset.xOffset).assertEqual("0.00px");
      expect(obj.$attrs.initialOffset.yOffset).assertEqual("0.00px");
      console.info('[scrollinitialOffsetNullUndefined_0200] END');
    })

    /**
     * @tc.name   scrollinitialOffsetNullUndefined_0300
     * @tc.number scrollinitialOffsetNullUndefined_0300
     * @tc.desc   Test Scroll initialOffset property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollinitialOffsetNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[scrollinitialOffsetNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scroll_initialOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollinitialOffsetNullUndefined_0300] default xOffset is: " + JSON.stringify(obj.$attrs.initialOffset.xOffset));
      console.info("[scrollinitialOffsetNullUndefined_0300] default yOffset is: " + JSON.stringify(obj.$attrs.initialOffset.yOffset));

      // Scroll initialOffset 设置undefined
      expect(obj.$attrs.initialOffset.xOffset).assertEqual("0.00px");
      expect(obj.$attrs.initialOffset.yOffset).assertEqual("0.00px");
      console.info('[scrollinitialOffsetNullUndefined_0300] END');
    })
  })
}