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

export default function getParamByNameUndefined() {
  describe('getParamByNameUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("getParamByNameUndefined beforeAll start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("getParamByNameUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/getParamByName',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get getParamByNameUndefined state pages:" + JSON.stringify(pages));
        if (!("getParamByName" == pages.name)) {
          console.info("get getParamByNameUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getParamByNameUndefined page error:" + err);
      }
      console.info("getParamByNameUndefined beforeEach end");

    });
    afterEach(async () => {
      console.info("getParamByNameUndefined afterEach start");
      try {
        let driver: Driver = Driver.create();
        // 尝试返回到初始页面，清理可能残留的页面跳转状态
        await driver.pressBack();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('[getParamByNameUndefined] afterEach cleanup error: ' + err);
      }
      console.info("getParamByNameUndefined afterEach end");
    });

    /**
     * @tc.number   getParamByNameUndefined_static_0001
     * @tc.name     getParamByNameUndefined_static_0001
     * @tc.desc     test getParamByName - verify result with and without pushed page
     * @tc.level    Level.LEVEL1
     */
    it('getParamByNameUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[getParamByNameUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);

      // 步骤1: 直接点击 getParamByName，此时 PageHome1 还未被 push
      let getParamBtn = await driver.findComponent(ON.id('getParamButton'));
      if (getParamBtn) {
        await getParamBtn.click();
        await CommonFunc.sleep(1000);
      }

      let strJson = inspector.getInspectorByKey('resultText');
      console.info('[getParamByNameUndefined_static_0001] Step1 strJson: ' + strJson);
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[getParamByNameUndefined_static_0001] Step1 result text (no page): ' + res);

      expect(res).assertEqual('Result: 0');

      // 步骤2: 点击 pushPathByName 按钮，跳转到 PageHome1 页面并传递参数 'testParam'
      let pushBtn = await driver.findComponent(ON.id('pushButton'));
      if (pushBtn) {
        await pushBtn.click();
        await CommonFunc.sleep(1500);
      }

      // 步骤3: 重新查找并点击 getParamByName 按钮
      getParamBtn = await driver.findComponent(ON.id('getParamButton'));
      if (getParamBtn) {
        await getParamBtn.click();
        await CommonFunc.sleep(1000);
      }

      // 验证结果文本显示参数值
      strJson = inspector.getInspectorByKey('resultText');
      console.info('[getParamByNameUndefined_static_0001] Step3 strJson: ' + strJson);
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      console.info('[getParamByNameUndefined_static_0001] Step3 result text (with param): ' + res);

      expect(res).assertEqual('Result: 1');

      console.info('[getParamByNameUndefined_static_0001] END');
      done();
    });

  })
}

