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

export default function listDefaultTest1() {
  describe('listDefaultTest1', () => {
    beforeAll(async (done: Function) => {
      console.info("listDefaultTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listDefault/listDefault1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("listDefault1" == pages.name)) {
          console.info("get listDefaultTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listDefaultTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listDefaultTest1 page error:" + err);
      }
      console.info("listDefaultTest1 beforeEach end");
      done();
    });

    // ========== lanes tests (value: number | LengthConstrain, gutter?: Dimension) ==========
    /**
     * @tc.name   listLanesNullUndefined_0100
     * @tc.number listLanesNullUndefined_0100
     * @tc.desc   Test list lanes property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listLanesNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listLanesNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_lanes_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listLanesNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.lanes));

      // list lanes 设置null
      expect(obj.$attrs.lanes).assertEqual("1");
      console.info('[listLanesNullUndefined_0100] END');
    })

    /**
     * @tc.name   listLanesNullUndefined_0200
     * @tc.number listLanesNullUndefined_0200
     * @tc.desc   Test list lanes property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listLanesNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listLanesNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_lanes_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listLanesNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.lanes));

      // list lanes 设置undefined
      expect(obj.$attrs.lanes).assertEqual("1");
      console.info('[listLanesNullUndefined_0200] END');
    })

    /**
     * @tc.name   listLanesNullUndefined_0300
     * @tc.number listLanesNullUndefined_0300
     * @tc.desc   Test list lanes gutter property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listLanesNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listLanesNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_lanes_gutter_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listLanesNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.lanes));

      // list lanes gutter 设置null
      expect(obj.$attrs.lanes).assertEqual("2");
      console.info('[listLanesNullUndefined_0300] END');
    })

    /**
     * @tc.name   listLanesNullUndefined_0400
     * @tc.number listLanesNullUndefined_0400
     * @tc.desc   Test list lanes gutter property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listLanesNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[listLanesNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('list_lanes_gutter_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listLanesNullUndefined_0400] undefined obj is: " +JSON.stringify(obj.$attrs.lanes));

      // list lanes gutter 设置undefined
      expect(obj.$attrs.lanes).assertEqual("2");
      console.info('[listLanesNullUndefined_0400] END');
    })

    // ========== alignListItem tests (number) ==========
    /**
     * @tc.name   listAlignListItemNullUndefined_0100
     * @tc.number listAlignListItemNullUndefined_0100
     * @tc.desc   Test list alignListItem property with End
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listAlignListItemNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listAlignListItemNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_alignListItem_end');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listAlignListItemNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.alignListItem));

      // list alignListItem 设置End
      expect(obj.$attrs.alignListItem).assertEqual("ListItemAlign.End");
      console.info('[listAlignListItemNullUndefined_0100] END');
    })

    /**
     * @tc.name   listAlignListItemNullUndefined_0200
     * @tc.number listAlignListItemNullUndefined_0200
     * @tc.desc   Test list alignListItem property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listAlignListItemNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listAlignListItemNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_alignListItem_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listAlignListItemNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.alignListItem));

      // list alignListItem 设置null
      expect(obj.$attrs.alignListItem).assertEqual("ListItemAlign.Start");
      console.info('[listAlignListItemNullUndefined_0200] END');
    })

    /**
     * @tc.name   listAlignListItemNullUndefined_0300
     * @tc.number listAlignListItemNullUndefined_0300
     * @tc.desc   Test list alignListItem property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listAlignListItemNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listAlignListItemNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_alignListItem_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listAlignListItemNullUndefined_0300] undefined obj is: "+
      JSON.stringify(obj.$attrs.alignListItem));

      // list alignListItem 设置undefined
      expect(obj.$attrs.alignListItem).assertEqual("ListItemAlign.Start");
      console.info('[listAlignListItemNullUndefined_0300] END');
    })

    // ========== listDirection tests ==========
    /**
     * @tc.name   listListDirectionNullUndefined_0100
     * @tc.number listListDirectionNullUndefined_0100
     * @tc.desc   Test list listDirection property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listListDirectionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listListDirectionNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_listDirection_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listListDirectionNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.listDirection));

      // list listDirection 不设置
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      console.info('[listListDirectionNullUndefined_0100] END');
    })

    /**
     * @tc.name   listListDirectionNullUndefined_0200
     * @tc.number listListDirectionNullUndefined_0200
     * @tc.desc   Test list listDirection property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listListDirectionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listListDirectionNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_listDirection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listListDirectionNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.listDirection));

      // list listDirection 设置null
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      console.info('[listListDirectionNullUndefined_0200] END');
    })

    /**
     * @tc.name   listListDirectionNullUndefined_0300
     * @tc.number listListDirectionNullUndefined_0300
     * @tc.desc   Test list listDirection property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listListDirectionNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listListDirectionNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_listDirection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listListDirectionNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.listDirection));

      // list listDirection 设置undefined
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      console.info('[listListDirectionNullUndefined_0300] END');
    })

    // ========== scrollBar tests ==========
    /**
     * @tc.name   listScrollBarNullUndefined_0100
     * @tc.number listScrollBarNullUndefined_0100
     * @tc.desc   Test list scrollBar property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listScrollBarNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listScrollBarNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_scrollBar_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listScrollBarNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.scrollBar));

      // list scrollBar 不设置，默认值Auto
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[listScrollBarNullUndefined_0100] END');
    })

    /**
     * @tc.name   listScrollBarNullUndefined_0200
     * @tc.number listScrollBarNullUndefined_0200
     * @tc.desc   Test list scrollBar property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listScrollBarNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listScrollBarNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_scrollBar_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listScrollBarNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.scrollBar));

      // list scrollBar 设置null
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[listScrollBarNullUndefined_0200] END');
    })

    /**
     * @tc.name   listScrollBarNullUndefined_0300
     * @tc.number listScrollBarNullUndefined_0300
     * @tc.desc   Test list scrollBar property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listScrollBarNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listScrollBarNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_scrollBar_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listScrollBarNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.scrollBar));

      // list scrollBar 设置undefined
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[listScrollBarNullUndefined_0300] END');
    })

    // ========== edgeEffect tests ==========
    /**
     * @tc.name   listEdgeEffectNullUndefined_0100
     * @tc.number listEdgeEffectNullUndefined_0100
     * @tc.desc   Test list edgeEffect property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEdgeEffectNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listEdgeEffectNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('list_edgeEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_edgeEffect_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listEdgeEffectNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.edgeEffect));
      console.info("[listEdgeEffectNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.edgeEffect));

      // list edgeEffect 设置null
      expect(obj.$attrs.edgeEffect).assertEqual(objCompare.$attrs.edgeEffect);
      console.info('[listEdgeEffectNullUndefined_0100] END');
    })

    /**
     * @tc.name   listEdgeEffectNullUndefined_0200
     * @tc.number listEdgeEffectNullUndefined_0200
     * @tc.desc   Test list edgeEffect property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEdgeEffectNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listEdgeEffectNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('list_edgeEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_edgeEffect_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listEdgeEffectNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.edgeEffect));
      console.info("[listEdgeEffectNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.edgeEffect));

      // list edgeEffect 设置undefined
      expect(obj.$attrs.edgeEffect).assertEqual(objCompare.$attrs.edgeEffect);
      console.info('[listEdgeEffectNullUndefined_0200] END');
    })

    /**
     * @tc.name   listEdgeEffectNullUndefined_0300
     * @tc.number listEdgeEffectNullUndefined_0300
     * @tc.desc   Test list edgeEffect options property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEdgeEffectNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listEdgeEffectNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('list_edgeEffect_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listEdgeEffectNullUndefined_0300] null obj is: " +
      JSON.stringify(obj.$attrs.edgeEffect));

      // list edgeEffect options 设置null
      expect(obj.$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[listEdgeEffectNullUndefined_0300] END');
    })

    /**
     * @tc.name   listEdgeEffectNullUndefined_0400
     * @tc.number listEdgeEffectNullUndefined_0400
     * @tc.desc   Test list edgeEffect options property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEdgeEffectNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[listEdgeEffectNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('list_edgeEffect_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listEdgeEffectNullUndefined_0400] undefined obj is: " +
      JSON.stringify(obj.$attrs.edgeEffect));

      // list edgeEffect options 设置undefined
      expect(obj.$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[listEdgeEffectNullUndefined_0400] END');
    })

    // ========== contentStartOffset tests ==========
    /**
     * @tc.name   listContentStartOffsetNullUndefined_0100
     * @tc.number listContentStartOffsetNullUndefined_0100
     * @tc.desc   Test list contentStartOffset property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listContentStartOffsetNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listContentStartOffsetNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_contentStartOffset_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listContentStartOffsetNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.contentStartOffset));

      // list contentStartOffset 不设置
      expect(obj.$attrs.contentStartOffset).assertEqual("0.000000");
      console.info('[listContentStartOffsetNullUndefined_0100] END');
    })

    /**
     * @tc.name   listContentStartOffsetNullUndefined_0200
     * @tc.number listContentStartOffsetNullUndefined_0200
     * @tc.desc   Test list contentStartOffset property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listContentStartOffsetNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listContentStartOffsetNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_contentStartOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listContentStartOffsetNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.contentStartOffset));

      // list contentStartOffset 设置null
      expect(obj.$attrs.contentStartOffset).assertEqual("0.000000");
      console.info('[listContentStartOffsetNullUndefined_0200] END');
    })

    /**
     * @tc.name   listContentStartOffsetNullUndefined_0300
     * @tc.number listContentStartOffsetNullUndefined_0300
     * @tc.desc   Test list contentStartOffset property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listContentStartOffsetNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listContentStartOffsetNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_contentStartOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listContentStartOffsetNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.contentStartOffset));

      // list contentStartOffset 设置undefined
      expect(obj.$attrs.contentStartOffset).assertEqual("0.000000");
      console.info('[listContentStartOffsetNullUndefined_0300] END');
    })

    // ========== contentEndOffset tests ==========
    /**
     * @tc.name   listContentEndOffsetNullUndefined_0100
     * @tc.number listContentEndOffsetNullUndefined_0100
     * @tc.desc   Test list contentEndOffset property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listContentEndOffsetNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listContentEndOffsetNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_contentEndOffset_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listContentEndOffsetNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listContentEndOffsetNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.contentEndOffset));

      // list contentEndOffset 不设置
      expect(obj.$attrs.contentEndOffset).assertEqual("0.000000");
      console.info('[listContentEndOffsetNullUndefined_0100] END');
    })

    /**
     * @tc.name   listContentEndOffsetNullUndefined_0200
     * @tc.number listContentEndOffsetNullUndefined_0200
     * @tc.desc   Test list contentEndOffset property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listContentEndOffsetNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listContentEndOffsetNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_contentEndOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listContentEndOffsetNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listContentEndOffsetNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.contentEndOffset));

      // list contentEndOffset 设置null
      expect(obj.$attrs.contentEndOffset).assertEqual("0.000000");
      console.info('[listContentEndOffsetNullUndefined_0200] END');
    })

    /**
     * @tc.name   listContentEndOffsetNullUndefined_0300
     * @tc.number listContentEndOffsetNullUndefined_0300
     * @tc.desc   Test list contentEndOffset property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listContentEndOffsetNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listContentEndOffsetNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_contentEndOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listContentEndOffsetNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[listContentEndOffsetNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.contentEndOffset));

      // list contentEndOffset 设置undefined
      expect(obj.$attrs.contentEndOffset).assertEqual("0.000000");
      console.info('[listContentEndOffsetNullUndefined_0300] END');
    })

    // ========== divider tests ==========
    /**
     * @tc.name   listDividerNullUndefined_0100
     * @tc.number listDividerNullUndefined_0100
     * @tc.desc   Test list divider property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listDividerNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listDividerNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_divider_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listDividerNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listDividerNullUndefined_0100] null strokeWidth is: " +
      JSON.stringify(obj.$attrs.divider.strokeWidth));
      console.info("[listDividerNullUndefined_0100] null startMargin is: " +
      JSON.stringify(obj.$attrs.divider.startMargin));
      console.info("[listDividerNullUndefined_0100] null endMargin is: " +
      JSON.stringify(obj.$attrs.divider.endMargin));
      console.info("[listDividerNullUndefined_0100] null color is: " +
      JSON.stringify(obj.$attrs.divider.color));

      // list divider 设置null, {"strokeWidth":"0.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#00000000"}
      expect(obj.$attrs.divider.strokeWidth).assertEqual("0.00vp");
      expect(obj.$attrs.divider.startMargin).assertEqual("0.00vp");
      expect(obj.$attrs.divider.endMargin).assertEqual("0.00vp");
      console.info('[listDividerNullUndefined_0100] END');
    })

    /**
     * @tc.name   listDividerNullUndefined_0200
     * @tc.number listDividerNullUndefined_0200
     * @tc.desc   Test list divider property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listDividerNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listDividerNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('list_divider_null');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_divider_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);


      console.info("[listDividerNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listDividerNullUndefined_0200] default strokeWidth is: " +
      JSON.stringify(objCompare.$attrs.divider.strokeWidth));
      console.info("[listDividerNullUndefined_0200] default startMargin is: " +
      JSON.stringify(objCompare.$attrs.divider.startMargin));
      console.info("[listDividerNullUndefined_0200] default endMargin is: " +
      JSON.stringify(objCompare.$attrs.divider.endMargin));
      console.info("[listDividerNullUndefined_0200] default color is: " +
      JSON.stringify(objCompare.$attrs.divider.color));
      console.info("[listDividerNullUndefined_0200] null strokeWidth is: " +
      JSON.stringify(obj.$attrs.divider.strokeWidth));
      console.info("[listDividerNullUndefined_0200] null startMargin is: " +
      JSON.stringify(obj.$attrs.divider.startMargin));
      console.info("[listDividerNullUndefined_0200] null endMargin is: " +
      JSON.stringify(obj.$attrs.divider.endMargin));
      console.info("[listDividerNullUndefined_0200] null color is: " +
      JSON.stringify(obj.$attrs.divider.color));

      // list divider 设置undefined, {"strokeWidth":"0.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#00000000"}
      expect(obj.$attrs.divider.strokeWidth).assertEqual(objCompare.$attrs.divider.strokeWidth);
      expect(obj.$attrs.divider.startMargin).assertEqual(objCompare.$attrs.divider.startMargin);
      expect(obj.$attrs.divider.endMargin).assertEqual(objCompare.$attrs.divider.endMargin);
      expect(obj.$attrs.divider.color).assertEqual(objCompare.$attrs.divider.color);
      console.info('[listDividerNullUndefined_0200] END');
    })
  })
}