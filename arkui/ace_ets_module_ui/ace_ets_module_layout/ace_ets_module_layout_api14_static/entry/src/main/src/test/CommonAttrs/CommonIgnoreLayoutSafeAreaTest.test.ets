'use static'
/*
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import { LayoutSafeAreaType, LayoutSafeAreaEdge } from '@kit.ArkUI';
import hilog from '@ohos.hilog';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'CommonIgnoreLayoutSafeAreaTest';

export default function CommonIgnoreLayoutSafeAreaTest() {
  describe('CommonIgnoreLayoutSafeAreaTest', (): void => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.layout.api14.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info(domain, tag, 'startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info(domain, tag, 'CommonIgnoreLayoutSafeAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonAttrs/CommonIgnoreLayoutSafeArea",
      };
      try {
        const testRouter = AppStorage.get<Router>("router") as Router;
        testRouter.clear();
        let pages: router.RouterState = testRouter.getState();
        console.info(domain, tag, 'get state pages: %{public}s', JSON.stringify(pages));
        if (!("CommonIgnoreLayoutSafeArea" == pages.name)) {
          testRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        hilog.error(domain, tag, 'push page error: %{public}s', JSON.stringify(err) as string);
      }
      console.info(domain, tag, 'CommonIgnoreLayoutSafeAreaTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(domain, tag, 'CommonIgnoreLayoutSafeAreaTest after each called');
    });

    // ==================== 调用覆盖白名单测试 ====================
    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0100
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_INVOKE_0100
     * @tc.desc   Test common ignoreLayoutSafeArea invoke - verify Row component supports ignoreLayoutSafeArea
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0100] START');
      let strJson = inspector.getInspectorByKey('row_invoke_test');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0100] row_invoke_test inspector: %{public}s', strJson);
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0100] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0200
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_INVOKE_0200
     * @tc.desc   Test common ignoreLayoutSafeArea invoke - verify Column component supports ignoreLayoutSafeArea
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0200] START');
      let strJson = inspector.getInspectorByKey('column_invoke_test');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0200] column_invoke_test inspector: %{public}s', strJson);
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0200] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0300
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_INVOKE_0300
     * @tc.desc   Test common ignoreLayoutSafeArea invoke - verify Stack component supports ignoreLayoutSafeArea
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0300] START');
      let strJson = inspector.getInspectorByKey('stack_invoke_test');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0300] stack_invoke_test inspector: %{public}s', strJson);
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0300] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0400
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_INVOKE_0400
     * @tc.desc   Test common ignoreLayoutSafeArea invoke - verify Flex component supports ignoreLayoutSafeArea
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0400] START');
      let strJson = inspector.getInspectorByKey('flex_invoke_test');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0400] flex_invoke_test inspector: %{public}s', strJson);
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0400] END');
      done();
    });

    // ==================== 入参覆盖白名单测试 ====================
    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0500
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_ARG_0100
     * @tc.desc   Test common ignoreLayoutSafeArea arg - verify empty array [] behaves as not effective
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0500] START');
      let strJson = inspector.getInspectorByKey('row_empty_array');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证组件尺寸保持原有设置 (80x80)
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0500] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"20.00vp"');
      expect(height).assertEqual('"20.00vp"');
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0500] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0600
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_ARG_0200
     * @tc.desc   Test common ignoreLayoutSafeArea arg - verify default behavior (no parameters)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0600] START');
      let strJson = inspector.getInspectorByKey('row_default');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证组件尺寸保持原有设置 (80x80) - 默认值为 SYSTEM, ALL
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0600] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"20.00vp"');
      expect(height).assertEqual('"20.00vp"');
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0600] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0700
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_ARG_0300
     * @tc.desc   Test common ignoreLayoutSafeArea arg - verify LayoutSafeAreaType.SYSTEM with START, TOP edges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0700] START');
      let strJson = inspector.getInspectorByKey('row_system_start_top');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 固定尺寸组件应保持原有尺寸
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0700] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"15.00vp"');
      expect(height).assertEqual('"15.00vp"');
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0700] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_0800
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_ARG_0400
     * @tc.desc   Test common ignoreLayoutSafeArea arg - verify LayoutSafeAreaType.SYSTEM with END, BOTTOM edges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0800] START');
      let strJson = inspector.getInspectorByKey('row_system_end_bottom');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 固定尺寸组件应保持原有尺寸
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0800] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"15.00vp"');
      expect(height).assertEqual('"15.00vp"');
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_0800] END');
      done();
    });

    // ==================== 参数规格覆盖白名单测试 ====================
    /**
     * @tc.name   commonIgnoreLayoutSafeArea_1100
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_SPEC_0200
     * @tc.desc   Test common ignoreLayoutSafeArea spec - verify LayoutSafeAreaType.SYSTEM with LayoutSafeAreaEdge.ALL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1100] START');
      let strJson = inspector.getInspectorByKey('row_all_edges');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1100] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"20.00vp"');
      expect(height).assertEqual('"20.00vp"');
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1100] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_1200
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_SPEC_0300
     * @tc.desc   Test common ignoreLayoutSafeArea spec - verify only types parameter, no edges (edges defaults to ALL)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1200] START');
      let strJson = inspector.getInspectorByKey('row_only_types');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1200] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"20.00vp"');
      expect(height).assertEqual('"20.00vp"');
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1200] END');
      done();
    });

    /**
     * @tc.name   commonIgnoreLayoutSafeArea_1300
     * @tc.number SUB_ARKUI_COMMON_IGNORELAYOUTSAFEAREA_SPEC_0400
     * @tc.desc   Test common ignoreLayoutSafeArea spec - verify only edges parameter, no types (types defaults to SYSTEM)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonIgnoreLayoutSafeArea_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1300] START');
      let strJson = inspector.getInspectorByKey('row_only_edges');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      let height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1300] width: %{public}s, height: %{public}s', width, height);
      expect(width).assertEqual('"20.00vp"');
      expect(height).assertEqual('"20.00vp"');
      console.info(domain, tag, '[commonIgnoreLayoutSafeArea_1300] END');
      done();
    });
  });
}