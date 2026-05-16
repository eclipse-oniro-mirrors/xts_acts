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
let tag: string = 'LayoutPolicyFixAtIdealSizeTest';

export default function layoutPolicyFixAtIdealSizeAttribute() {
  describe('LayoutPolicyFixAtIdealSizeTest', (): void => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      console.info(domain, tag, 'startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info(domain, tag, 'LayoutPolicyFixAtIdealSizeTest beforeEach start');
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LayoutPolicy/LayoutPolicyFixAtIdealSize",
      };
      try {
        const layoutPolicyRouter = AppStorage.get<Router>("router") as Router;
        layoutPolicyRouter.clear();
        let pages: router.RouterState = layoutPolicyRouter.getState();
        console.info(domain, tag, 'get state pages: %{public}s', JSON.stringify(pages));
        if (!("LayoutPolicyFixAtIdealSize" == pages.name)) {
          layoutPolicyRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        hilog.error(domain, tag, 'push page error: %{public}s', JSON.stringify(err) as string);
      }
      console.info(domain, tag, 'LayoutPolicyFixAtIdealSizeTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(domain, tag, 'LayoutPolicyFixAtIdealSizeTest after each called');
    });

    /**
     * @tc.name   layoutPolicyFixAtIdealSize_with_constraint_0200
     * @tc.number layoutPolicyFixAtIdealSize_with_constraint_0200
     * @tc.desc   Test LayoutPolicy.fixAtIdealSize with constraintSize - verify constraint constraintSize is set correctly (50x50)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('layoutPolicyFixAtIdealSize_with_constraint_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0200] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('row_constraintSize_test2');
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0200] inspector: %{public}s', strJson);
      // 验证组件存在
      expect(strJson.length > 0).assertTrue();

      // 验证组件受 constraintSize 约束为 50x50（子组件80x80）
      let obj_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0200] width: %{public}s', obj_width);
      expect(obj_width).assertEqual('"10.00vp"');

      let obj_height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0200] height: %{public}s', obj_height);
      expect(obj_height).assertEqual('"10.00vp"');

      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0200] END');
      done();
    });

    /**
     * @tc.name   layoutPolicyFixAtIdealSize_with_constraint_0400
     * @tc.number layoutPolicyFixAtIdealSize_with_constraint_0400
     * @tc.desc   Test LayoutPolicy.fixAtIdealSize with constraintSize - verify constraint constraintSize is set correctly (width约束80, height约束60)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('layoutPolicyFixAtIdealSize_with_constraint_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0400] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('row_constraintSize_test4');
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0400] inspector: %{public}s', strJson);
      // 验证组件存在
      expect(strJson.length > 0).assertTrue();

      // 验证组件受 height constraintSize 约束为 60，width 不受约束为 80
      let obj_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0400] width: %{public}s', obj_width);
      // 不受约束的宽度应为 80
      expect(obj_width).assertEqual('"10.00vp"');

      let obj_height = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0400] height: %{public}s', obj_height);
      expect(obj_height).assertEqual('"10.00vp"');

      console.info(domain, tag, '[layoutPolicyFixAtIdealSize_with_constraint_0400] END');
      done();
    });
  });
}