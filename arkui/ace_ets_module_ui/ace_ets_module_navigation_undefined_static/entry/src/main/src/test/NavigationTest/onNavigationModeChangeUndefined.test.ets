/**
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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function onNavigationModeChangeUndefined() {
  describe('onNavigationModeChangeUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("onNavigationModeChangeUndefined beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("onNavigationModeChangeUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/onNavigationModeChange',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onNavigationModeChangeUndefined state pages:" + JSON.stringify(pages));
        if (!("onNavigationModeChange" == pages.name)) {
          console.info("get onNavigationModeChangeUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onNavigationModeChangeUndefined page error:" + err);
      }
      console.info("onNavigationModeChangeUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   onNavigationModeChangeUndefined_static_0001
     * @tc.name     onNavigationModeChangeUndefined_static_0001
     * @tc.desc     test onNavigationModeChange callback - dynamic switch with counter
     * @tc.level    Level.LEVEL1
     */
    it('onNavigationModeChangeUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onNavigationModeChangeUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 点击切换 mode 按钮，应该触发 onNavigationModeChange 回调，changeCount 增加
      let changeModeBtn = await driver.findComponent(ON.id('changeModeButton'));
      if (changeModeBtn) {
        await changeModeBtn.click();
        await CommonFunc.sleep(1000);
      }

      // 检查 changeCount 是否变为 2
      let strJson = inspector.getInspectorByKey('changeCountText');
      console.info('[onNavigationModeChangeUndefined_static_0001] strJson: ' + strJson);
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[onNavigationModeChangeUndefined_static_0001] changeCount after first click: ' + res);
      expect(res).assertEqual('changeCount:2');

      // 点击切换按钮，切换为 undefined
      let toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      console.info('[onNavigationModeChangeUndefined_static_0001] Toggle to undefined');
      await (toggleBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 再次点击切换 mode 按钮，onNavigationModeChange 是 undefined，不会触发回调，changeCount 保持不变
      if (changeModeBtn) {
        await changeModeBtn.click();
        await CommonFunc.sleep(1000);
      }

      // 检查 changeCount 仍然是 2（没有增加）
      strJson = inspector.getInspectorByKey('changeCountText');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[onNavigationModeChangeUndefined_static_0001] changeCount after undefined click: ' + res);
      expect(res).assertEqual('changeCount:2');

      console.info('[onNavigationModeChangeUndefined_static_0001] END');
      done();
    });

  })
}

