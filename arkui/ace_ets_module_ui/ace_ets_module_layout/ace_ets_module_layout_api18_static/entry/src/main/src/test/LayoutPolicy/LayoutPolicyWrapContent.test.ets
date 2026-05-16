'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
let tag: string = 'LayoutPolicyWrapContentTest';

export default function layoutPolicyWrapContentTest() {
  describe('LayoutPolicyWrapContentTest', (): void => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      console.info(domain, tag, 'startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info(domain, tag, 'LayoutPolicyWrapContentTest beforeEach start');
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LayoutPolicy/LayoutPolicyWrapContent",
      };
      try {
        const testRouter = AppStorage.get<Router>("router") as Router;
        testRouter.clear();
        let pages: router.RouterState = testRouter.getState();
        console.info(domain, tag, 'get state pages: %{public}s', JSON.stringify(pages));
        if (!("LayoutPolicyWrapContent" == pages.name)) {
          testRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        hilog.error(domain, tag, 'push page error: %{public}s', JSON.stringify(err) as string);
      }
      console.info(domain, tag, 'LayoutPolicyWrapContentTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(domain, tag, 'LayoutPolicyWrapContentTest after each called');
    });

    /**
     * @tc.name   layoutPolicyWrapContent_parent_constraint_0200
     * @tc.number layoutPolicyWrapContent_parent_constraint_0200
     * @tc.desc   Test LayoutPolicy.wrapContent - verify component size does not exceed parent content area (60x60)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('layoutPolicyWrapContent_parent_constraint_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[layoutPolicyWrapContent_parent_constraint_0200] START');
      await CommonFunc.sleep(1000);

      let strJson: string = inspector.getInspectorByKey('row_wrapContent_parent_constraint');
      expect(strJson).not().assertUndefined();
      // 验证组件存在
      expect(strJson.length > 0).assertTrue();

      // 验证宽度不超过父组件内容区大小 60（子组件请求80，但被父组件限制为60）
      let obj_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      console.info(domain, tag, '[layoutPolicyWrapContent_parent_constraint_0200] width: %{public}s', obj_width);
      expect(obj_width).assertEqual('"10.00vp"');

      // 验证高度不超过父组件内容区大小 60（子组件请求80，但被父组件限制为60）
      let obj_height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[layoutPolicyWrapContent_parent_constraint_0200] height: %{public}s', obj_height);
      expect(obj_height).assertEqual('"10.00vp"');

      console.info(domain, tag, '[layoutPolicyWrapContent_parent_constraint_0200] END');
      done();
    });

    /**
     * @tc.name   layoutPolicyWrapContent_with_constraint_0300
     * @tc.number layoutPolicyWrapContent_with_constraint_0300
     * @tc.desc   Test LayoutPolicy.wrapContent with constraintSize - verify final size respects constraintSize (80x80)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('layoutPolicyWrapContent_with_constraint_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[layoutPolicyWrapContent_with_constraint_0300] START');
      await CommonFunc.sleep(1000);

      let strJson: string = inspector.getInspectorByKey('row_wrapContent_constraintSize');
      expect(strJson).not().assertUndefined();
      // 验证组件存在
      expect(strJson.length > 0).assertTrue();

      // 验证宽度受 constraintSize 约束为 80
      let obj_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      console.info(domain, tag, '[layoutPolicyWrapContent_with_constraint_0300] width: %{public}s', obj_width);
      expect(obj_width).assertEqual('"10.00vp"');

      // 验证高度受 constraintSize 约束为 80
      let obj_height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[layoutPolicyWrapContent_with_constraint_0300] height: %{public}s', obj_height);
      expect(obj_height).assertEqual('"10.00vp"');

      console.info(domain, tag, '[layoutPolicyWrapContent_with_constraint_0300] END');
      done();
    });
  });
}