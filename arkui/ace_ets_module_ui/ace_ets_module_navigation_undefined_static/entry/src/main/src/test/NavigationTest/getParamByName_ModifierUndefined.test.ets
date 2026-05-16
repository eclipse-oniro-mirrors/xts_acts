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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
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

export default function getParamByNameModifierUndefined() {
  describe('getParamByNameModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("getParamByNameModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("getParamByNameModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/getParamByName_modifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get getParamByNameModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("getParamByName_modifier" == pages.name)) {
          console.info("get getParamByNameModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getParamByNameModifierUndefined page error:" + err);
      }
      console.info("getParamByNameModifierUndefined beforeEach end");

    });
    afterEach(async () => {
      console.info("getParamByNameModifierUndefined afterEach start");
      try {
        let driver: Driver = Driver.create();
        // 尝试返回到初始页面，清理可能残留的页面跳转状态
        await driver.pressBack();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('[getParamByNameModifierUndefined] afterEach cleanup error: ' + err);
      }
      console.info("getParamByNameModifierUndefined afterEach end");
    });

    /**
     * @tc.number   getParamByNameModifierUndefined_static_0001
     * @tc.name     getParamByNameModifierUndefined_static_0001
     * @tc.desc     test getParamByName with modifier - verify result with and without pushed page
     * @tc.level    Level.LEVEL1
     */
    it('getParamByNameModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[getParamByNameModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 步骤1: 验证初始状态 - modifier.isUndefined = false
      let toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      if (toggleBtn) {
        let toggleText = await toggleBtn.getText();
        console.info('[getParamByNameModifierUndefined_static_0001] Initial toggle text: ' + toggleText);
        expect(toggleText.indexOf('false') > -1).assertTrue();
      }

      // 步骤2: 直接点击 getParamByName，此时 PageHome1 还未被 push
      let getParamBtn = await driver.findComponent(ON.id('getParamButton'));
      if (getParamBtn) {
        await getParamBtn.click();
        await CommonFunc.sleep(1000);
      }

      let strJson = inspector.getInspectorByKey('resultText');
      console.info('[getParamByNameModifierUndefined_static_0001] Step2 strJson: ' + strJson);
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[getParamByNameModifierUndefined_static_0001] Step2 result text (no page): ' + res);
      expect(res).assertEqual('Result: 0');

      // 步骤3: 点击 pushPathByName 按钮
      let pushBtn = await driver.findComponent(ON.id('pushButton'));
      if (pushBtn) {
        await pushBtn.click();
        await CommonFunc.sleep(1500);
      }

      // 步骤4: 重新查找并点击 getParamByName 按钮
      getParamBtn = await driver.findComponent(ON.id('getParamButton'));
      if (getParamBtn) {
        await getParamBtn.click();
        await CommonFunc.sleep(1500);
      }

      strJson = inspector.getInspectorByKey('resultText');
      console.info('[getParamByNameModifierUndefined_static_0001] Step4 strJson: ' + strJson);
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[getParamByNameModifierUndefined_static_0001] Step4 result text (with param): ' + res);
      expect(res).assertEqual('Result: 1');

      // 步骤5: 点击 Toggle Modifier 按钮，切换 modifier 状态
      toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      if (toggleBtn) {
        await toggleBtn.click();
        await CommonFunc.sleep(1000);
      }

      // 步骤6: 验证切换后状态 - modifier.isUndefined = true
      toggleBtn = await driver.findComponent(ON.id('toggleButton'));
      if (toggleBtn) {
        let toggleText = await toggleBtn.getText();
        console.info('[getParamByNameModifierUndefined_static_0001] After toggle text: ' + toggleText);
        expect(toggleText.indexOf('true') > -1).assertTrue();
      }

      console.info('[getParamByNameModifierUndefined_static_0001] END');
      done();
    });

  })
}

