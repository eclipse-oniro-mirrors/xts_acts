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

export default function customNavContentTransitionUndefined() {
  describe('customNavContentTransitionUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("customNavContentTransitionUndefined beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("customNavContentTransitionUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/customNavContentTransitionUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get customNavContentTransitionUndefined state pages:" + JSON.stringify(pages));
        if (!("customNavContentTransitionUndefined" == pages.name)) {
          console.info("get customNavContentTransitionUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push customNavContentTransitionUndefined page error:" + err);
      }
      console.info("customNavContentTransitionUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   customNavContentTransitionUndefined_static_0001
     * @tc.name     customNavContentTransitionUndefined_static_0001
     * @tc.desc     test customNavContentTransition callback - dynamic switch
     * @tc.level    Level.LEVEL1
     */
    it('customNavContentTransitionUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[customNavContentTransitionUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 验证初始状态：def = true（非 undefined）
      let toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      if (toggleBtn) {
        let toggleText = await toggleBtn.getText();
        console.info('[customNavContentTransitionUndefined_static_0001] Initial toggle text: ' + toggleText);
        // 验证包含 "true" 表示当前是非 undefined 状态
        expect(toggleText.indexOf('true') > -1).assertTrue();
      }

      // 点击 pushPathByName 按钮触发转场（使用自定义回调，返回 undefined = 默认转场）
      let pushBtn = await driver.findComponent(ON.id('pushButton'));
      if (pushBtn) {
        await pushBtn.click();
        await CommonFunc.sleep(1500);
      }

      //判断回调更新结果
      let strJson2 = inspector.getInspectorByKey('changeCountText');
      let obj2 = JSON.parseJsonElement(strJson2);
      let testText2 = obj2.getElement('$attrs').getString('content');
      expect(testText2).assertEqual("0");

      // 点击返回按钮返回到初始页面
      await driver.pressBack();
      await CommonFunc.sleep(1000);

      // 点击切换按钮，切换为 undefined
      if (toggleBtn) {
        await toggleBtn.click();
        await CommonFunc.sleep(1000);
      }

      // 验证切换后状态：def = false（undefined）
      toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      if (toggleBtn) {
        let toggleText = await toggleBtn.getText();
        console.info('[customNavContentTransitionUndefined_static_0001] After toggle text: ' + toggleText);
        // 验证包含 "false" 表示当前是 undefined 状态
        expect(toggleText.indexOf('false') > -1).assertTrue();
      }

      // 再次点击 pushPathByName 按钮触发转场（回调为 undefined = 默认转场）
      if (pushBtn) {
        await pushBtn.click();
        await CommonFunc.sleep(1500);
      }

      //判断回调更新结果
      let strJson3 = inspector.getInspectorByKey('changeCountText');
      let obj3 = JSON.parseJsonElement(strJson3);
      let testText3 = obj3.getElement('$attrs').getString('content');
      expect(testText3).assertEqual("-1");

      // 点击返回
      await driver.pressBack();
      await CommonFunc.sleep(1000);

      console.info('[customNavContentTransitionUndefined_static_0001] END');
      done();
    });

  })
}

