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

export default function listDefaultTest2() {
  describe('listDefaultTest2', () => {
    beforeAll(async (done: Function) => {
      console.info("listDefaultTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listDefault/listDefault2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("listDefault2" == pages.name)) {
          console.info("get listDefaultTest2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listDefaultTest2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listDefaultTest2 page error:" + err);
      }
      console.info("listDefaultTest2 beforeEach end");
      done();
    });

    // ========== editMode tests (boolean) ==========
    /**
     * @tc.name   listEditModeNullUndefined_0100
     * @tc.number listEditModeNullUndefined_0100
     * @tc.desc   Test List editMode property with on set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listEditModeNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_editMode_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEditModeNullUndefined_0100] on set is: " + JSON.stringify(obj.$attrs.editMode));

      // list editMode 不设置
      expect(obj.$attrs.editMode).assertEqual(false);
      console.info('[listEditModeNullUndefined_0100] END');
    })

    /**
     * @tc.name   listEditModeNullUndefined_0200
     * @tc.number listEditModeNullUndefined_0200
     * @tc.desc   Test List editMode property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listEditModeNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_editMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEditModeNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.editMode));

      // list editMode 设置null
      expect(obj.$attrs.editMode).assertEqual(false);
      console.info('[listEditModeNullUndefined_0200] END');
    })

    /**
     * @tc.name   listEditModeNullUndefined_0300
     * @tc.number listEditModeNullUndefined_0300
     * @tc.desc   Test List editMode property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listEditModeNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_editMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEditModeNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.editMode));

      // list editMode 设置undefined
      expect(obj.$attrs.editMode).assertEqual(false);
      console.info('[listEditModeNullUndefined_0300] END');
    })

    // ========== multiSelectable tests (boolean) ==========
    /**
     * @tc.name   listMultiSelectableNullUndefined_0100
     * @tc.number listMultiSelectableNullUndefined_0100
     * @tc.desc   Test List multiSelectable property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listMultiSelectableNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listMultiSelectableNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_multiSelectable_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listMultiSelectableNullUndefined_0100] false obj is: " +
        JSON.stringify(obj.$attrs.multiSelectable));

      // list multiSelectable 设置false
      expect(obj.$attrs.multiSelectable).assertEqual(false);
      console.info('[listMultiSelectableNullUndefined_0100] END');
    })

    /**
     * @tc.name   listMultiSelectableNullUndefined_0200
     * @tc.number listMultiSelectableNullUndefined_0200
     * @tc.desc   Test List multiSelectable property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listMultiSelectableNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listMultiSelectableNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_multiSelectable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listMultiSelectableNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.multiSelectable));

      // list multiSelectable 设置null
      expect(obj.$attrs.multiSelectable).assertEqual(false);
      console.info('[listMultiSelectableNullUndefined_0200] END');
    })

    /**
     * @tc.name   listMultiSelectableNullUndefined_0300
     * @tc.number listMultiSelectableNullUndefined_0300
     * @tc.desc   Test List multiSelectable property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listMultiSelectableNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listMultiSelectableNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_multiSelectable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listMultiSelectableNullUndefined_0300] undefined obj is: "+
      JSON.stringify(obj.$attrs.multiSelectable));

      // list multiSelectable 设置undefined
      expect(obj.$attrs.multiSelectable).assertEqual(false);
      console.info('[listMultiSelectableNullUndefined_0300] END');
    })

    // ========== cachedCount tests ==========
    /**
     * @tc.name   listCachedCountNullUndefined_0100
     * @tc.number listCachedCountNullUndefined_0100
     * @tc.desc   Test List cachedCount property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listCachedCountNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listCachedCountNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_cachedCount_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listCachedCountNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.cachedCount));

      // list cachedCount 设置null
      expect(obj.$attrs.cachedCount).assertEqual("1");
      console.info('[listCachedCountNullUndefined_0100] END');
    })

    /**
     * @tc.name   listCachedCountNullUndefined_0200
     * @tc.number listCachedCountNullUndefined_0200
     * @tc.desc   Test List cachedCount property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listCachedCountNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listCachedCountNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_cachedCount_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listCachedCountNullUndefined_0200] undefined obj is: " +
      JSON.stringify(obj.$attrs.cachedCount));

      // list cachedCount 设置undefined
      expect(obj.$attrs.cachedCount).assertEqual("1");
      console.info('[listCachedCountNullUndefined_0200] END');
    })

    /**
     * @tc.name   listCachedCountNullUndefined_0300
     * @tc.number listCachedCountNullUndefined_0300
     * @tc.desc   Test List cachedCount show property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listCachedCountNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listCachedCountNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_cachedCount_show_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listCachedCountNullUndefined_0300] default obj is: " +
      JSON.stringify(obj.$attrs.cachedCount));

      // list cachedCount show设置false
      expect(obj.$attrs.cachedCount).assertEqual("2");
      console.info('[listCachedCountNullUndefined_0300] END');
    })

    // ========== chainAnimation tests ==========
    /**
     * @tc.name   listChainAnimationNullUndefined_0100
     * @tc.number listChainAnimationNullUndefined_0100
     * @tc.desc   Test List chainAnimation property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listChainAnimationNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listChainAnimationNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_chainAnimation_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listChainAnimationNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.chainAnimation));

      // list chainAnimation 不设置
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      console.info('[listChainAnimationNullUndefined_0100] END');
    })

    /**
     * @tc.name   listChainAnimationNullUndefined_0200
     * @tc.number listChainAnimationNullUndefined_0200
     * @tc.desc   Test List chainAnimation property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listChainAnimationNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listChainAnimationNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_chainAnimation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listChainAnimationNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.chainAnimation));

      // list chainAnimation 设置null
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      console.info('[listChainAnimationNullUndefined_0200] END');
    })

    /**
     * @tc.name   listChainAnimationNullUndefined_0300
     * @tc.number listChainAnimationNullUndefined_0300
     * @tc.desc   Test List chainAnimation property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listChainAnimationNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listChainAnimationNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_chainAnimation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listChainAnimationNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.chainAnimation));

      // list chainAnimation 设置undefined
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      console.info('[listChainAnimationNullUndefined_0300] END');
    })

    // ========== sticky tests ==========
    /**
     * @tc.name   listStickyNullUndefined_0100
     * @tc.number listStickyNullUndefined_0100
     * @tc.desc   Test List sticky property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listStickyNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listStickyNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_sticky_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listStickyNullUndefined_0100] default obj is: " +
      JSON.stringify(obj.$attrs.sticky));

      // list sticky 不设置
      expect(obj.$attrs.sticky).assertEqual("StickyStyle.None");
      console.info('[listStickyNullUndefined_0100] END');
    })

    /**
     * @tc.name   listStickyNullUndefined_0200
     * @tc.number listStickyNullUndefined_0200
     * @tc.desc   Test List sticky property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listStickyNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listStickyNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_sticky_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listStickyNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.sticky));

      // list sticky 设置null
      expect(obj.$attrs.sticky).assertEqual("StickyStyle.None");
      console.info('[listStickyNullUndefined_0200] END');
    })

    /**
     * @tc.name   listStickyNullUndefined_0300
     * @tc.number listStickyNullUndefined_0300
     * @tc.desc   Test List sticky property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listStickyNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listStickyNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_sticky_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listStickyNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.sticky));

      // list sticky 设置undefined
      expect(obj.$attrs.sticky).assertEqual("StickyStyle.None");
      console.info('[listStickyNullUndefined_0300] END');
    })

    // ========== scrollSnapAlign tests ==========
    /**
     * @tc.name   listScrollSnapAlignNullUndefined_0100
     * @tc.number listScrollSnapAlignNullUndefined_0100
     * @tc.desc   Test List scrollSnapAlign property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listScrollSnapAlignNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listScrollSnapAlignNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_scrollSnapAlign_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listScrollSnapAlignNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[listScrollSnapAlignNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.scrollSnapAlign));

      // list scrollSnapAlign 不设置
      expect(obj.$attrs.scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE");
      console.info('[listScrollSnapAlignNullUndefined_0100] END');
    })

    /**
     * @tc.name   listScrollSnapAlignNullUndefined_0200
     * @tc.number listScrollSnapAlignNullUndefined_0200
     * @tc.desc   Test List scrollSnapAlign property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listScrollSnapAlignNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listScrollSnapAlignNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_scrollSnapAlign_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listScrollSnapAlignNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[listScrollSnapAlignNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.scrollSnapAlign));

      // list scrollSnapAlign 设置null
      expect(obj.$attrs.scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE");
      console.info('[listScrollSnapAlignNullUndefined_0200] END');
    })

    /**
     * @tc.name   listScrollSnapAlignNullUndefined_0300
     * @tc.number listScrollSnapAlignNullUndefined_0300
     * @tc.desc   Test List scrollSnapAlign property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listScrollSnapAlignNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listScrollSnapAlignNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_scrollSnapAlign_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listScrollSnapAlignNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[listScrollSnapAlignNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.scrollSnapAlign));

      // list scrollSnapAlign 设置undefined
      expect(obj.$attrs.scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE");
      console.info('[listScrollSnapAlignNullUndefined_0300] END');
    })
    
    // ========== nestedScroll tests ==========
    /**
     * @tc.name   listNestedScrollNullUndefined_0100
     * @tc.number listNestedScrollNullUndefined_0100
     * @tc.desc   Test List nestedScroll property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listNestedScrollNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listNestedScrollNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('list_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_nestedScroll_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[listNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[listNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[listNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // list nestedScroll 设置null
      expect(JSON.parse(strJsonCompare).$type).assertEqual('List');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);
      console.info('[listNestedScrollNullUndefined_0100] END');
    })

    /**
     * @tc.name   listNestedScrollNullUndefined_0200
     * @tc.number listNestedScrollNullUndefined_0200
     * @tc.desc   Test List nestedScroll property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listNestedScrollNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listNestedScrollNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('list_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_nestedScroll_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listNestedScrollNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[listNestedScrollNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[listNestedScrollNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[listNestedScrollNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // list nestedScroll 设置undefined
      expect(JSON.parse(strJsonCompare).$type).assertEqual('List');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);
      console.info('[listNestedScrollNullUndefined_0200] END');
    })

    // ========== enableScrollInteraction tests ==========
    /**
     * @tc.name   listEnableScrollInteractionNullUndefined_0100
     * @tc.number listEnableScrollInteractionNullUndefined_0100
     * @tc.desc   Test List enableScrollInteraction property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableScrollInteractionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listEnableScrollInteractionNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_enableScrollInteraction_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEnableScrollInteractionNullUndefined_0100] false obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // Scroll enableScrollInteraction 设置false
      expect(obj.$attrs.enableScrollInteraction).assertEqual(false);
      console.info('[listEnableScrollInteractionNullUndefined_0100] END');
    })

    /**
     * @tc.name   listEnableScrollInteractionNullUndefined_0200
     * @tc.number listEnableScrollInteractionNullUndefined_0200
     * @tc.desc   Test List enableScrollInteraction property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableScrollInteractionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listEnableScrollInteractionNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_enableScrollInteraction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEnableScrollInteractionNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // Scroll enableScrollInteraction 设置null
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[listEnableScrollInteractionNullUndefined_0200] END');
    })

    /**
     * @tc.name   listEnableScrollInteractionNullUndefined_0300
     * @tc.number listEnableScrollInteractionNullUndefined_0300
     * @tc.desc   Test List enableScrollInteraction property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableScrollInteractionNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listEnableScrollInteractionNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_enableScrollInteraction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEnableScrollInteractionNullUndefined_0300] undefined obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // Scroll enableScrollInteraction 设置undefined
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[listEnableScrollInteractionNullUndefined_0300] END');
    })
  })
}