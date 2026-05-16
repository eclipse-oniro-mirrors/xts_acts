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

export default function listItemNullUndefinedTest() {
  describe('listItemNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("listItemNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ListItem/listItemNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listItemNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("listItemNullUndefined" == pages.name)) {
          console.info("get listItemNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listItemNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listItemNullUndefinedTest page error:" + err);
      }
      console.info("listItemNullUndefinedTest beforeEach end");
      done();
    });

    // ========== sticky tests (Sticky) ==========
    /**
     * @tc.name   listItemStickyNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEM_STICKY_NULL_0100
     * @tc.desc   Test ListItem sticky property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemStickyNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemStickyNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItem_sticky_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemStickyNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemStickyNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.sticky));

      // ListItem sticky 不设置
      expect(obj.$attrs.sticky).assertEqual("Sticky.None");
      console.info('[listItemStickyNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemStickyNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEM_STICKY_NULL_0200
     * @tc.desc   Test ListItem sticky property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemStickyNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemStickyNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItem_sticky_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemStickyNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemStickyNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.sticky));

      // ListItem sticky 设置null，应恢复为默认值
      expect(obj.$attrs.sticky).assertEqual("Sticky.None");
      console.info('[listItemStickyNullUndefined_0200] END');
    })

    /**
     * @tc.name   listItemStickyNullUndefined_0300
     * @tc.number SUB_ARKUI_LISTITEM_STICKY_UNDEFINED_0300
     * @tc.desc   Test ListItem sticky property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemStickyNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listItemStickyNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('listItem_sticky_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemStickyNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[listItemStickyNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.sticky));

      // ListItem sticky 设置undefined，应恢复为默认值
      expect(obj.$attrs.sticky).assertEqual("Sticky.None");
      console.info('[listItemStickyNullUndefined_0300] END');
    })

    // ========== editable tests (boolean | EditMode) ==========
    /**
     * @tc.name   listItemEditableNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEM_EDITABLE_NULL_0100
     * @tc.desc   Test ListItem editable property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemEditableNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemEditableNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItem_editable_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemEditableNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemEditableNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.editable));

      // ListItem editable 不设置
      expect(obj.$attrs.editable).assertEqual(false);
      console.info('[listItemEditableNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemEditableNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEM_EDITABLE_NULL_0200
     * @tc.desc   Test ListItem editable property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemEditableNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemEditableNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItem_editable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemEditableNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemEditableNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.editable));

      // ListItem editable 设置null，应恢复为默认值
      expect(obj.$attrs.editable).assertEqual(false);
      console.info('[listItemEditableNullUndefined_0200] END');
    })

    /**
     * @tc.name   listItemEditableNullUndefined_0300
     * @tc.number SUB_ARKUI_LISTITEM_EDITABLE_UNDEFINED_0300
     * @tc.desc   Test ListItem editable property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemEditableNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listItemEditableNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('listItem_editable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemEditableNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[listItemEditableNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.editable));

      // ListItem editable 设置undefined，应恢复为默认值
      expect(obj.$attrs.editable).assertEqual(false);
      console.info('[listItemEditableNullUndefined_0300] END');
    })

    /**
     * @tc.name   listItemEditableNullUndefined_0400
     * @tc.number listItemEditableNullUndefined_0400
     * @tc.desc   Test ListItem editable property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemEditableNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[listItemEditableNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('listItem_editable_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemEditableNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[listItemEditableNullUndefined_0400] false obj is: " + JSON.stringify(obj.$attrs.editable));

      // ListItem editable 设置false
      expect(obj.$attrs.editable).assertEqual(false);
      console.info('[listItemEditableNullUndefined_0400] END');
    })

    // ========== selectable tests (boolean) ==========
    /**
     * @tc.name   listItemSelectableNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEM_SELECTABLE_NULL_0100
     * @tc.desc   Test ListItem selectable property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSelectableNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemSelectableNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItem_selectable_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSelectableNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSelectableNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.selectable));

      // ListItem selectable 不设置，默认值true
      expect(obj.$attrs.selectable).assertEqual(true);
      console.info('[listItemSelectableNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemSelectableNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEM_SELECTABLE_NULL_0200
     * @tc.desc   Test ListItem selectable property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSelectableNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemSelectableNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItem_selectable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSelectableNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSelectableNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.selectable));

      // ListItem selectable 设置null，应恢复为默认值true
      expect(obj.$attrs.selectable).assertEqual(true);
      console.info('[listItemSelectableNullUndefined_0200] END');
    })

    /**
     * @tc.name   listItemSelectableNullUndefined_0300
     * @tc.number SUB_ARKUI_LISTITEM_SELECTABLE_UNDEFINED_0300
     * @tc.desc   Test ListItem selectable property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSelectableNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listItemSelectableNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('listItem_selectable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSelectableNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSelectableNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.selectable));

      // ListItem selectable 设置undefined，应恢复为默认值true
      expect(obj.$attrs.selectable).assertEqual(true);
      console.info('[listItemSelectableNullUndefined_0300] END');
    })

    // ========== selected tests (boolean) ==========
    /**
     * @tc.name   listItemSelectedNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEM_SELECTED_NULL_0100
     * @tc.desc   Test ListItem selected property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSelectedNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemSelectedNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItem_selected_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSelectedNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSelectedNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.selected));

      // ListItem selected 不设置，默认值false
      expect(obj.$attrs.selected).assertEqual(false);
      console.info('[listItemSelectedNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemSelectedNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEM_SELECTED_NULL_0200
     * @tc.desc   Test ListItem selected property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSelectedNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemSelectedNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItem_selected_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSelectedNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSelectedNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.selected));

      // ListItem selected 设置null，应恢复为默认值false
      expect(obj.$attrs.selected).assertEqual(false);
      console.info('[listItemSelectedNullUndefined_0200] END');
    })

    /**
     * @tc.name   listItemSelectedNullUndefined_0300
     * @tc.number SUB_ARKUI_LISTITEM_SELECTED_UNDEFINED_0300
     * @tc.desc   Test ListItem selected property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSelectedNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listItemSelectedNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('listItem_selected_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSelectedNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSelectedNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.selected));

      // ListItem selected 设置undefined，应恢复为默认值false
      expect(obj.$attrs.selected).assertEqual(false);
      console.info('[listItemSelectedNullUndefined_0300] END');
    })

    /**
     * @tc.name   listItemSelectedNullUndefined_0400
     * @tc.number listItemSelectedNullUndefined_0400
     * @tc.desc   Test ListItem selected property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSelectedNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[listItemSelectedNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('listItem_selected_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSelectedNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSelectedNullUndefined_0400] false obj is: " + JSON.stringify(obj.$attrs.selected));

      // ListItem selected 设置false
      expect(obj.$attrs.selected).assertEqual(false);
      console.info('[listItemSelectedNullUndefined_0400] END');
    })

    // ========== swipeAction tests (SwipeActionOptions) ==========
    /**
     * @tc.name   listItemSwipeActionNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEM_SWIPEACTION_NULL_0100
     * @tc.desc   Test ListItem swipeAction property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSwipeActionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemSwipeActionNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItem_swipeAction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSwipeActionNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSwipeActionNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.swipeAction));

      // ListItem swipeAction 设置null，应恢复为默认值: {"edgeEffect":"SwipeEdgeEffect.Spring"}
      expect(obj.$type).assertEqual("ListItem");
      expect(obj.$attrs.swipeAction.edgeEffect).assertEqual("SwipeEdgeEffect.Spring");
      console.info('[listItemSwipeActionNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemSwipeActionNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEM_SWIPEACTION_UNDEFINED_0200
     * @tc.desc   Test ListItem swipeAction property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemSwipeActionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemSwipeActionNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItem_swipeAction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemSwipeActionNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemSwipeActionNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.swipeAction));

      // ListItem swipeAction 设置undefined，应恢复为默认值: {"edgeEffect":"SwipeEdgeEffect.Spring"}
      expect(obj.$type).assertEqual("ListItem");
      expect(obj.$attrs.swipeAction.edgeEffect).assertEqual("SwipeEdgeEffect.Spring");
      console.info('[listItemSwipeActionNullUndefined_0200] END');
    })

    // ========== ListItemOptions (style) tests ==========
    /**
     * @tc.name   listItemOptionsNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEM_OPTIONS_NULL_0100
     * @tc.desc   Test ListItem ListItemOptions property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemOptionsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemOptionsNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('listItem_options_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItem_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemOptionsNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemOptionsNullUndefined_0100] no set obj is: " + JSON.stringify(objCompare.$attrs.style));
      console.info("[listItemOptionsNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.style));

      // ListItem ListItemOptions 设置null，默认值ListItemStyle.NONE
      expect(obj.$type).assertEqual("ListItem");
      expect(obj.$attrs.style).assertEqual(objCompare.$attrs.style);
      console.info('[listItemOptionsNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemOptionsNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEM_OPTIONS_NULL_0200
     * @tc.desc   Test ListItem ListItemOptions property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemOptionsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemOptionsNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('listItem_options_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItem_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemOptionsNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemOptionsNullUndefined_0200] no set obj is: " + JSON.stringify(objCompare.$attrs.style));
      console.info("[listItemOptionsNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.style));

      // ListItem ListItemOptions 设置undefined，应恢复为默认值ListItemStyle.NONE
      expect(obj.$type).assertEqual("ListItem");
      expect(obj.$attrs.style).assertEqual(objCompare.$attrs.style);
      console.info('[listItemOptionsNullUndefined_0200] END');
    })

    // ========== onSelect tests ==========
    /**
     * @tc.name   listItemOnSelectNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEM_ONSELECT_NULL_0100
     * @tc.desc   Test ListItem onSelect property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemOnSelectNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemOnSelectNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('listItem_onSelect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItem_onSelect_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemOnSelectNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemOnSelectNullUndefined_0100] no set obj is: " + JSON.stringify(objCompare.$attrs.onSelect));
      console.info("[listItemOnSelectNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.onSelect));

      // ListItem onSelect 设置null，应恢复为默认值
      expect(obj.$type).assertEqual("ListItem");
      expect(obj.$attrs.onSelect).assertEqual(objCompare.$attrs.onSelect);
      console.info('[listItemOnSelectNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemOnSelectNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEM_ONSELECT_NULL_0200
     * @tc.desc   Test ListItem onSelect property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemOnSelectNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemOnSelectNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('listItem_onSelect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItem_onSelect_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemOnSelectNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemOnSelectNullUndefined_0200] no set obj is: " + JSON.stringify(objCompare.$attrs.onSelect));
      console.info("[listItemOnSelectNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.onSelect));

      // ListItem onSelect 设置undefined，应恢复为默认值
      expect(obj.$type).assertEqual("ListItem");
      expect(obj.$attrs.onSelect).assertEqual(objCompare.$attrs.onSelect);
      console.info('[listItemOnSelectNullUndefined_0200] END');
    })
  })
}