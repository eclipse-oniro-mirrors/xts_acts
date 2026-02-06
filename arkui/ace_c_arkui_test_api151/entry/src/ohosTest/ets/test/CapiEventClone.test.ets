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

import { describe, it, expect , beforeEach, Level} from '@ohos/hypium';
import Utils from './common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function CapiEventCloneTest() {

  describe('CapiEventCloneTest', () => {

    let PAGE_TAG = 'CapiEventClone';

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });
    /**
     * @tc.name   CapiEventCloneTest001
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0070
     * @tc.desc   C侧创建Scroll并设置滚动条宽度为20，开启跨语言，TS侧改变滚动条宽度测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CapiEventCloneTest001', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[CapiEventCloneTest001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.text("原组件"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let textJson = getInspectorByKey('res');
      let obj: ESObject = JSON.parse(textJson);
      console.info("[CapiEventCloneTest001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual(100)
    });
  })
}