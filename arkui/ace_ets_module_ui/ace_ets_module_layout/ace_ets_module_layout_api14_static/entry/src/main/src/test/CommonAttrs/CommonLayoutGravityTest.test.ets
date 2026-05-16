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
import hilog from '@ohos.hilog';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'CommonLayoutGravityTest';

export default function CommonLayoutGravityTest() {
  describe('CommonLayoutGravityTest', (): void => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.layout.api14.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info(domain, tag, 'startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info(domain, tag, 'CommonLayoutGravityTest beforeEach start');
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonAttrs/CommonLayoutGravity",
      };
      try {
        const testRouter = AppStorage.get<Router>("router") as Router;
        testRouter.clear();
        let pages: router.RouterState = testRouter.getState();
        console.info(domain, tag, 'get state pages: %{public}s', JSON.stringify(pages));
        if (!("CommonLayoutGravity" == pages.name)) {
          testRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        hilog.error(domain, tag, 'push page error: %{public}s', JSON.stringify(err) as string);
      }
      console.info(domain, tag, 'CommonLayoutGravityTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(domain, tag, 'CommonLayoutGravityTest after each called');
    });

    // ==================== 调用覆盖白名单测试 ====================
    /**
     * @tc.name   commonLayoutGravity_0100
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_INVOKE_0100
     * @tc.desc   Test common layoutGravity invoke - verify Text component supports layoutGravity in Stack
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0100] START');
      let strJson = inspector.getInspectorByKey('stack_invoke_text');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性存在且值为 CENTER
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0100] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.Center"');
      console.info(domain, tag, '[commonLayoutGravity_0100] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_0200
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_INVOKE_0200
     * @tc.desc   Test common layoutGravity invoke - verify Button component supports layoutGravity in Stack
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0200] START');
      let strJson = inspector.getInspectorByKey('stack_invoke_button');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性存在且值为 CENTER
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0200] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.Center"');
      console.info(domain, tag, '[commonLayoutGravity_0200] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_0300
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_INVOKE_0300
     * @tc.desc   Test common layoutGravity invoke - verify Image component supports layoutGravity in Stack
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0300] START');
      let strJson = inspector.getInspectorByKey('stack_invoke_image');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性存在且值为 CENTER
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0300] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.Center"');
      console.info(domain, tag, '[commonLayoutGravity_0300] END');
      done();
    });

    // ==================== 入参覆盖白名单测试 ====================
    /**
     * @tc.name   commonLayoutGravity_0400
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0100
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.CENTER (default)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0400] START');
      let strJson = inspector.getInspectorByKey('stack_args_center');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 CENTER
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0400] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.Center"');
      console.info(domain, tag, '[commonLayoutGravity_0400] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_0500
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0200
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.TOP_START
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0500] START');
      let strJson = inspector.getInspectorByKey('stack_args_top_start');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 TOP_START
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0500] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.TopStart"');
      console.info(domain, tag, '[commonLayoutGravity_0500] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_0600
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0300
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.Top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0600] START');
      let strJson = inspector.getInspectorByKey('stack_args_top');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 Top
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0600] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.Top"');
      console.info(domain, tag, '[commonLayoutGravity_0600] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_0700
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0400
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.TOP_END
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0700] START');
      let strJson = inspector.getInspectorByKey('stack_args_top_end');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 TOP_END
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0700] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.TopEnd"');
      console.info(domain, tag, '[commonLayoutGravity_0700] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_0800
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0500
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.START
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0800] START');
      let strJson = inspector.getInspectorByKey('stack_args_start');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 START
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0800] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.Start"');
      console.info(domain, tag, '[commonLayoutGravity_0800] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_0900
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0600
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.END
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_0900] START');
      let strJson = inspector.getInspectorByKey('stack_args_end');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 END
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_0900] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.End"');
      console.info(domain, tag, '[commonLayoutGravity_0900] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_1000
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0700
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.BOTTOM_START
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_1000] START');
      let strJson = inspector.getInspectorByKey('stack_args_bottom_start');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 BOTTOM_START
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_1000] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.BottomStart"');
      console.info(domain, tag, '[commonLayoutGravity_1000] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_1100
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0800
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_1100] START');
      let strJson = inspector.getInspectorByKey('stack_args_bottom');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 BOTTOM
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_1100] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.Bottom"');
      console.info(domain, tag, '[commonLayoutGravity_1100] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_1200
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_ARG_0900
     * @tc.desc   Test common layoutGravity arg - verify LocalizedAlignment.BOTTOM_END
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_1200] START');
      let strJson = inspector.getInspectorByKey('stack_args_bottom_end');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证 layoutGravity 属性值为 BOTTOM_END
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_1200] layoutGravity: %{public}s', layoutGravity);
      expect(layoutGravity).assertEqual('"Alignment.BottomEnd"');
      console.info(domain, tag, '[commonLayoutGravity_1200] END');
      done();
    });

    // ==================== 参数规格覆盖白名单测试 ====================
    /**
     * @tc.name   commonLayoutGravity_1300
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_SPEC_0100
     * @tc.desc   Test common layoutGravity spec - verify undefined input defaults to CENTER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_1300] START');
      let strJson = inspector.getInspectorByKey('stack_args_spec_undefined');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      // 验证组件存在，undefined参数按默认值CENTER处理
      let layoutGravity = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('layoutGravity'));
      console.info(domain, tag, '[commonLayoutGravity_1300] layoutGravity: %{public}s', layoutGravity);
      // undefined 输入应按默认值 CENTER 处理
      expect(layoutGravity).assertEqual('"Alignment.Center"');
      console.info(domain, tag, '[commonLayoutGravity_1300] END');
      done();
    });

    // ==================== 返回值覆盖白名单测试 ====================
    /**
     * @tc.name   commonLayoutGravity_1500
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_RETURN_0100
     * @tc.desc   Test common layoutGravity return - verify method returns this for chain call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_1500] START');
      // 验证页面中存在通过链式调用设置的组件，说明 layoutGravity 返回了 this
      let strJson = inspector.getInspectorByKey('stack_invoke_text');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let hasText = strJson.includes("Text");
      expect(hasText).assertTrue();
      console.info(domain, tag, '[commonLayoutGravity_1500] END');
      done();
    });

    /**
     * @tc.name   commonLayoutGravity_1600
     * @tc.number SUB_ARKUI_COMMON_LAYOUTGRAVITY_RETURN_0200
     * @tc.desc   Test common layoutGravity return - verify chain call with multiple attributes works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('commonLayoutGravity_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[commonLayoutGravity_1600] START');
      // 验证页面上有组件可以用多个属性同时链式调用
      let strJson = inspector.getInspectorByKey('stack_args_center');
      expect(strJson).not().assertUndefined();
      expect(strJson.length > 0).assertTrue();
      let hasText = strJson.includes("Text");
      expect(hasText).assertTrue();
      console.info(domain, tag, '[commonLayoutGravity_1600] END');
      done();
    });
  });
}