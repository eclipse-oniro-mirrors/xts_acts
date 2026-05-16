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

export default function listDefaultTest3() {
  describe('listDefaultTest3', () => {
    beforeAll(async (done: Function) => {
      console.info("listDefaultTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listDefault/listDefault3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("listDefault3" == pages.name)) {
          console.info("get listDefaultTest3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listDefaultTest3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listDefaultTest3 page error:" + err);
      }
      console.info("listDefaultTest3 beforeEach end");
      done();
    });

    // ========== friction tests ==========
    /**
     * @tc.name   listFrictionNullUndefined_0100
     * @tc.number listFrictionNullUndefined_0100
     * @tc.desc   Test list friction property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listFrictionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listFrictionNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('list_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_friction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listFrictionNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[listFrictionNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.friction));

      // list friction 设置null
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[listFrictionNullUndefined_0100] END');
    })

    /**
     * @tc.name   listFrictionNullUndefined_0200
     * @tc.number listFrictionNullUndefined_0200
     * @tc.desc   Test list friction property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listFrictionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listFrictionNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('list_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_friction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listFrictionNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[listFrictionNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.friction));

      // list friction 设置undefined
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[listFrictionNullUndefined_0200] END');
    })

    // ========== childrenMainSize tests ==========
    /**
     * @tc.name   listChildrenMainSizeNullUndefined_0100
     * @tc.number listChildrenMainSizeNullUndefined_0100
     * @tc.desc   Test List childrenMainSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listChildrenMainSizeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listChildrenMainSizeNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('list_childrenMainSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_childrenMainSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listChildrenMainSizeNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.childrenMainSize));
      console.info("[listChildrenMainSizeNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.childrenMainSize));

      // list childrenMainSize 设置null
      expect(obj.$attrs.childrenMainSize).assertEqual(objCompare.$attrs.childrenMainSize);
      console.info('[listChildrenMainSizeNullUndefined_0100] END');
    })

    /**
     * @tc.name   listChildrenMainSizeNullUndefined_0200
     * @tc.number listChildrenMainSizeNullUndefined_0200
     * @tc.desc   Test List childrenMainSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listChildrenMainSizeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listChildrenMainSizeNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('list_childrenMainSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_childrenMainSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listChildrenMainSizeNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.childrenMainSize));
      console.info("[listChildrenMainSizeNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.childrenMainSize));

      // list childrenMainSize 设置undefined
      expect(obj.$attrs.childrenMainSize).assertEqual(objCompare.$attrs.childrenMainSize);
      console.info('[listChildrenMainSizeNullUndefined_0200] END');
    })

    // ========== maintainVisibleContentPosition tests ==========
    /**
     * @tc.name   listMaintainVisibleContentPositionNullUndefined_0100
     * @tc.number listMaintainVisibleContentPositionNullUndefined_0100
     * @tc.desc   Test List maintainVisibleContentPosition property with on set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listMaintainVisibleContentPositionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listMaintainVisibleContentPositionNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_maintainVisibleContentPosition_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listMaintainVisibleContentPositionNullUndefined_0100] on set is: " +
        JSON.stringify(obj.$attrs.maintainVisibleContentPosition));

      // list maintainVisibleContentPosition 不设置
      expect(obj.$attrs.maintainVisibleContentPosition).assertEqual(false);
      console.info('[listMaintainVisibleContentPositionNullUndefined_0100] END');
    })

    /**
     * @tc.name   listMaintainVisibleContentPositionNullUndefined_0200
     * @tc.number listMaintainVisibleContentPositionNullUndefined_0200
     * @tc.desc   Test List maintainVisibleContentPosition property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listMaintainVisibleContentPositionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listMaintainVisibleContentPositionNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_maintainVisibleContentPosition_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listMaintainVisibleContentPositionNullUndefined_0200] null obj is: " +
        JSON.stringify(obj.$attrs.maintainVisibleContentPosition));

      // list maintainVisibleContentPosition 设置null
      expect(obj.$attrs.maintainVisibleContentPosition).assertEqual(false);
      console.info('[listMaintainVisibleContentPositionNullUndefined_0200] END');
    })

    /**
     * @tc.name   listMaintainVisibleContentPositionNullUndefined_0300
     * @tc.number listMaintainVisibleContentPositionNullUndefined_0300
     * @tc.desc   Test List maintainVisibleContentPosition property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listMaintainVisibleContentPositionNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listMaintainVisibleContentPositionNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_maintainVisibleContentPosition_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listMaintainVisibleContentPositionNullUndefined_0300] undefined obj is: " +
        JSON.stringify(obj.$attrs.maintainVisibleContentPosition));

      // list maintainVisibleContentPosition 设置undefined
      expect(obj.$attrs.maintainVisibleContentPosition).assertEqual(false);
      console.info('[listMaintainVisibleContentPositionNullUndefined_0300] END');
    })

    // ========== focusWrapMode tests ==========
    /**
     * @tc.name   listFocusWrapModeNullUndefined_0100
     * @tc.number listFocusWrapModeNullUndefined_0100
     * @tc.desc   Test List focusWrapMode property with on set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listFocusWrapModeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listFocusWrapModeNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_focusWrapMode_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listFocusWrapModeNullUndefined_0100] on set is: " + JSON.stringify(obj.$attrs.focusWrapMode));

      // list focusWrapMode 不设置
      expect(obj.$attrs.focusWrapMode).assertEqual("DEFAULT");
      console.info('[listFocusWrapModeNullUndefined_0100] END');
    })

    /**
     * @tc.name   listFocusWrapModeNullUndefined_0200
     * @tc.number listFocusWrapModeNullUndefined_0200
     * @tc.desc   Test List focusWrapMode property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listFocusWrapModeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listFocusWrapModeNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_focusWrapMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listFocusWrapModeNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.focusWrapMode));

      // list focusWrapMode 设置null
      expect(obj.$attrs.focusWrapMode).assertEqual("DEFAULT");
      console.info('[listFocusWrapModeNullUndefined_0200] END');
    })

    /**
     * @tc.name   listFocusWrapModeNullUndefined_0300
     * @tc.number listFocusWrapModeNullUndefined_0300
     * @tc.desc   Test List focusWrapMode property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listFocusWrapModeNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listFocusWrapModeNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_focusWrapMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listFocusWrapModeNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.focusWrapMode));

      // list focusWrapMode 设置undefined
      expect(obj.$attrs.focusWrapMode).assertEqual("DEFAULT");
      console.info('[listFocusWrapModeNullUndefined_0300] END');
    })

    // ========== syncLoad tests ==========
    /**
     * @tc.name   listSyncLoadNullUndefined_0100
     * @tc.number listSyncLoadNullUndefined_0100
     * @tc.desc   Test List syncLoad property with on set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listSyncLoadNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listSyncLoadNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('list_syncLoad_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listSyncLoadNullUndefined_0100] on set is: " + JSON.stringify(obj.$attrs.syncLoad));

      // list syncLoad 不设置
      expect(obj.$attrs.syncLoad).assertEqual(true);
      console.info('[listSyncLoadNullUndefined_0100] END');
    })

    /**
     * @tc.name   listSyncLoadNullUndefined_0200
     * @tc.number listSyncLoadNullUndefined_0200
     * @tc.desc   Test List syncLoad property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listSyncLoadNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listSyncLoadNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('list_syncLoad_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listSyncLoadNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.syncLoad));

      // list syncLoad 设置null
      expect(obj.$attrs.syncLoad).assertEqual(true);
      console.info('[listSyncLoadNullUndefined_0200] END');
    })

    /**
     * @tc.name   listSyncLoadNullUndefined_0300
     * @tc.number listSyncLoadNullUndefined_0300
     * @tc.desc   Test List syncLoad property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listSyncLoadNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[listSyncLoadNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('list_syncLoad_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listSyncLoadNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.syncLoad));

      // list syncLoad 设置undefined
      expect(obj.$attrs.syncLoad).assertEqual(true);
      console.info('[listSyncLoadNullUndefined_0300] END');
    })

    // ========== editModeOptions tests ==========
    /**
     * @tc.name   listEditModeOptionsNullUndefined_0100
     * @tc.number listEditModeOptionsNullUndefined_0100
     * @tc.desc   Test list editModeOptions property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeOptionsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[listEditModeOptionsNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('list_editModeOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_editModeOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listEditModeOptionsNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));
      console.info("[listEditModeOptionsNullUndefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));

      // list editModeOptions 设置null
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation)
        .assertEqual(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation);
      console.info('[listEditModeOptionsNullUndefined_0100] END');
    })

    /**
     * @tc.name   listEditModeOptionsNullUndefined_0200
     * @tc.number listEditModeOptionsNullUndefined_0200
     * @tc.desc   Test list editModeOptions property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeOptionsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[listEditModeOptionsNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('list_editModeOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('list_editModeOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[listEditModeOptionsNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));
      console.info("[listEditModeOptionsNullUndefined_0200] undefined obj is: " +
      JSON.stringify(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));

      // list editModeOptions 设置undefined
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation)
        .assertEqual(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation);
      console.info('[listEditModeOptionsNullUndefined_0200] END');
    })
  })
}