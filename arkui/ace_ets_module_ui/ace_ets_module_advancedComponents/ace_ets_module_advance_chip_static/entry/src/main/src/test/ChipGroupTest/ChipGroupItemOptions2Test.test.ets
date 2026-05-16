'use static';
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium';
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ChipGroupItemOptionsPage2Test() {
  describe('ChipGroupItemOptionsPage2Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipGroupItemOptionsPage2Test beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipGroupItemOptionsPage2Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroup/ChipGroupItemOptionsPage2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipGroupItemOptionsPage2Test state pages:" + JSON.stringify(pages));
        if (!("ChipGroupItemOptionsPage2" == pages.name)) {
          console.info("get ChipGroupItemOptionsPage2Test pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipGroupItemOptionsPage2Test page error:" + err);
      }
      console.info("ChipGroupItemOptionsPage2Test beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipGroupItemOptionsPage2Test after each called");
    });


    /**
     * @tc.number   ChipGroupItemOptionsPage2Test_static_001
     * @tc.name     ChipGroupItemOptionsPage2Test_static_001
     * @tc.desc     ChipGroupItemOptionsPage2Test_static_001
     * @tc.level    Level.LEVEL0
     */
    it('ChipGroupItemOptionsPage2Test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ChipGroupItemOptionsPage2Test_static_001] START');
      await CommonFunc.sleep(2000);
      let roots = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let src1 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getElement('$attrs')
        .getString('src')
      expect(src1).assertEqual("resource:///16777230.png");

      let height = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getElement('$attrs')
        .getElement('size')
        .getString('height')
      expect(height).assertEqual("18.00vp");
      let accessibilityText1 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getElement('$attrs')
        .getString('accessibilityText')
      expect(accessibilityText1).assertEqual("后缀图标的无障碍文本属性");
      let src2 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getElement('$attrs')
        .getString('src')
      expect(src2).assertEqual("resource:///125830091.svg");
      let accessibilityText2 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getElement('$attrs')
        .getString('accessibilityText')
      expect(accessibilityText2).assertEqual("保存");

      console.info('[ChipGroupItemOptionsPage2Test_static_001] END');
      done();
    });

  })
}