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

export default function listItemGroupNullUndefinedTest() {
  describe('listItemGroupNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("listItemGroupNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ListItemGroup/listItemGroupNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listItemGroupNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("listItemGroupNullUndefined" == pages.name)) {
          console.info("get listItemGroupNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listItemGroupNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listItemGroupNullUndefinedTest page error:" + err);
      }
      console.info("listItemGroupNullUndefinedTest beforeEach end");
      done();
    });

    // ========== divider tests (ListDividerOptions | null) ==========
    /**
     * @tc.name   listItemGroupDividerNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_DIVIDER_NULL_0100
     * @tc.desc   Test ListItemGroup divider property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupDividerNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemGroupDividerNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItemGroup_divider_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupDividerNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupDividerNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.divider));

      // ListItemGroup divider 设置null，应恢复为默认值
      // {"strokeWidth":"0.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#00000000"}
      expect(obj.$type).assertEqual("ListItemGroup");
      expect(obj.$attrs.divider.strokeWidth).assertEqual("0.00vp");
      expect(obj.$attrs.divider.startMargin).assertEqual("0.00vp");
      expect(obj.$attrs.divider.endMargin).assertEqual("0.00vp");
      console.info('[listItemGroupDividerNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemGroupDividerNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_DIVIDER_NULL_0200
     * @tc.desc   Test ListItemGroup divider property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupDividerNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemGroupDividerNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('listItemGroup_divider_null');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItemGroup_divider_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupDividerNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupDividerNullUndefined_0200] null obj is: " + JSON.stringify(objCompare.$attrs.divider));
      console.info("[listItemGroupDividerNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.divider));

      // ListItemGroup divider 设置undefined，应恢复为默认值
      // {"strokeWidth":"0.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#00000000"}
      expect(obj.$type).assertEqual("ListItemGroup");
      expect(obj.$attrs.divider.strokeWidth).assertEqual(objCompare.$attrs.divider.strokeWidth);
      expect(obj.$attrs.divider.startMargin).assertEqual(objCompare.$attrs.divider.startMargin);
      expect(obj.$attrs.divider.endMargin).assertEqual(objCompare.$attrs.divider.endMargin);
      expect(obj.$attrs.divider.color).assertEqual(objCompare.$attrs.divider.color);
      console.info('[listItemGroupDividerNullUndefined_0200] END');
    })

    // ========== childrenMainSize tests (ChildrenMainSize) ==========
    /**
     * @tc.name   listItemGroupChildrenMainSizeNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_CHILDRENMAINSIZE_NULL_0100
     * @tc.desc   Test ListItemGroup childrenMainSize property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupChildrenMainSizeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemGroupChildrenMainSizeNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('listItemGroup_childrenMainSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItemGroup_childrenMainSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupChildrenMainSizeNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupChildrenMainSizeNullUndefined_0100] no set obj is: " + JSON.stringify(objCompare.$attrs.childrenMainSize));
      console.info("[listItemGroupChildrenMainSizeNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.childrenMainSize));

      // ListItemGroup childrenMainSize 设置null
      expect(obj.$type).assertEqual("ListItemGroup");
      expect(obj.$attrs.childrenMainSize).assertEqual(objCompare.$attrs.childrenMainSize);
      console.info('[listItemGroupChildrenMainSizeNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemGroupChildrenMainSizeNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_CHILDRENMAINSIZE_UNDEFINED_0200
     * @tc.desc   Test ListItemGroup childrenMainSize property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupChildrenMainSizeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemGroupChildrenMainSizeNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('listItemGroup_childrenMainSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItemGroup_childrenMainSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupChildrenMainSizeNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupChildrenMainSizeNullUndefined_0200] no set obj is: " + JSON.stringify(objCompare.$attrs.childrenMainSize));
      console.info("[listItemGroupChildrenMainSizeNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.childrenMainSize));

      // ListItemGroup childrenMainSize 设置undefined
      expect(obj.$type).assertEqual("ListItemGroup");
      expect(obj.$attrs.childrenMainSize).assertEqual(objCompare.$attrs.childrenMainSize);
      console.info('[listItemGroupChildrenMainSizeNullUndefined_0200] END');
    })

    // ========== ListItemGroupOptions header tests ==========
    /**
     * @tc.name   listItemGroupOptionsHeaderNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_HEADER_NULL_0100
     * @tc.desc   Test ListItemGroupOptions header property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsHeaderNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsHeaderNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_header_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsHeaderNullUndefined_0100] type: " + JSON.stringify(obj.$type));

      // ListItemGroupOptions header 不设置，应该正常创建
      expect(obj.$type).assertEqual("ListItemGroup");
      console.info('[listItemGroupOptionsHeaderNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemGroupOptionsHeaderNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_HEADER_NULL_0200
     * @tc.desc   Test ListItemGroupOptions header property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsHeaderNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsHeaderNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_header_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsHeaderNullUndefined_0200] type: " + JSON.stringify(obj.$type));

      // ListItemGroupOptions header 设置null，应该正常创建
      expect(obj.$type).assertEqual("ListItemGroup");
      console.info('[listItemGroupOptionsHeaderNullUndefined_0200] END');
    })

    /**
     * @tc.name   listItemGroupOptionsHeaderNullUndefined_0300
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_HEADER_UNDEFINED_0300
     * @tc.desc   Test ListItemGroupOptions header property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsHeaderNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsHeaderNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_header_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsHeaderNullUndefined_0300] type: " + JSON.stringify(obj.$type));

      // ListItemGroupOptions header 设置undefined，应该正常创建
      expect(obj.$type).assertEqual("ListItemGroup");
      console.info('[listItemGroupOptionsHeaderNullUndefined_0300] END');
    })

    // ========== ListItemGroupOptions footer tests ==========
    /**
     * @tc.name   listItemGroupOptionsFooterNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_FOOTER_NULL_0100
     * @tc.desc   Test ListItemGroupOptions footer property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsFooterNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsFooterNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_footer_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsFooterNullUndefined_0100] type: " + JSON.stringify(obj.$type));

      // ListItemGroupOptions footer 不设置，应该正常创建
      expect(obj.$type).assertEqual("ListItemGroup");
      console.info('[listItemGroupOptionsFooterNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemGroupOptionsFooterNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_FOOTER_NULL_0200
     * @tc.desc   Test ListItemGroupOptions footer property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsFooterNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsFooterNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_footer_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsFooterNullUndefined_0200] type: " + JSON.stringify(obj.$type));

      // ListItemGroupOptions footer 设置null，应该正常创建
      expect(obj.$type).assertEqual("ListItemGroup");
      console.info('[listItemGroupOptionsFooterNullUndefined_0200] END');
    })

    /**
     * @tc.name   listItemGroupOptionsFooterNullUndefined_0300
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_FOOTER_UNDEFINED_0300
     * @tc.desc   Test ListItemGroupOptions footer property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsFooterNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsFooterNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_footer_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsFooterNullUndefined_0300] type: " + JSON.stringify(obj.$type));

      // ListItemGroupOptions footer 设置undefined，应该正常创建
      expect(obj.$type).assertEqual("ListItemGroup");
      console.info('[listItemGroupOptionsFooterNullUndefined_0300] END');
    })

    // ========== ListItemGroupOptions space tests (number|string) ==========
    /**
     * @tc.name   listItemGroupOptionsSpaceNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_SPACE_NULL_0100
     * @tc.desc   Test ListItemGroupOptions space property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsSpaceNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsSpaceNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_space_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsSpaceNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupOptionsSpaceNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.space));

      // ListItemGroupOptions space 不设置，默认值0
      expect(obj.$attrs.space).assertEqual("0.00vp");
      console.info('[listItemGroupOptionsSpaceNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemGroupOptionsSpaceNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_SPACE_EMPTY_0200
     * @tc.desc   Test ListItemGroupOptions space property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsSpaceNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsSpaceNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_space_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsSpaceNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupOptionsSpaceNullUndefined_0200] empty string obj is: " + JSON.stringify(obj.$attrs.space));

      // ListItemGroupOptions space 设置空字符串，应恢复为默认值0vp
      expect(obj.$attrs.space).assertEqual("0.00vp");
      console.info('[listItemGroupOptionsSpaceNullUndefined_0200] END');
    })

    /**
     * @tc.name   listItemGroupOptionsSpaceNullUndefined_0300
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_SPACE_NULL_0300
     * @tc.desc   Test ListItemGroupOptions space property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsSpaceNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsSpaceNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_space_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsSpaceNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupOptionsSpaceNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.space));

      // ListItemGroupOptions space 设置null，应恢复为默认值0vp
      expect(obj.$attrs.space).assertEqual("0.00vp");
      console.info('[listItemGroupOptionsSpaceNullUndefined_0300] END');
    })

    /**
     * @tc.name   listItemGroupOptionsSpaceNullUndefined_0400
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_SPACE_UNDEFINED_0400
     * @tc.desc   Test ListItemGroupOptions space property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsSpaceNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsSpaceNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('listItemGroup_options_space_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsSpaceNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupOptionsSpaceNullUndefined_0400] undefined obj is: " + JSON.stringify(obj.$attrs.space));

      // ListItemGroupOptions space 设置undefined，应恢复为默认值0vp
      expect(obj.$attrs.space).assertEqual("0.00vp");
      console.info('[listItemGroupOptionsSpaceNullUndefined_0400] END');
    })

    // ========== ListItemGroupOptions style tests ==========
    /**
     * @tc.name   listItemGroupOptionsStyleNullUndefined_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_STYLE_NULL_0100
     * @tc.desc   Test ListItemGroupOptions style property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsStyleNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsStyleNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('listItemGroup_options_style_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItemGroup_options_style_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsStyleNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupOptionsStyleNullUndefined_0100] no set obj is: " + JSON.stringify(objCompare.$attrs.style));
      console.info("[listItemGroupOptionsStyleNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.style));

      // ListItemGroupOptions style 设置null，应恢复为默认值ListItemGroupStyle.NONE
      expect(obj.$type).assertEqual("ListItemGroup");
      expect(obj.$attrs.style).assertEqual(objCompare.$attrs.style);
      console.info('[listItemGroupOptionsStyleNullUndefined_0100] END');
    })

    /**
     * @tc.name   listItemGroupOptionsStyleNullUndefined_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_OPTIONS_STYLE_UNDEFINED_0200
     * @tc.desc   Test ListItemGroupOptions style property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupOptionsStyleNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listItemGroupOptionsStyleNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('listItemGroup_options_style_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('listItemGroup_options_style_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listItemGroupOptionsStyleNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupOptionsStyleNullUndefined_0200] no set obj is: " + JSON.stringify(objCompare.$attrs.style));
      console.info("[listItemGroupOptionsStyleNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.style));

      // ListItemGroupOptions style 设置undefined，应恢复为默认值ListItemGroupStyle.NONE
      expect(obj.$type).assertEqual("ListItemGroup");
      expect(obj.$attrs.style).assertEqual(objCompare.$attrs.style);
      console.info('[listItemGroupOptionsStyleNullUndefined_0200] END');
    })
  })
}