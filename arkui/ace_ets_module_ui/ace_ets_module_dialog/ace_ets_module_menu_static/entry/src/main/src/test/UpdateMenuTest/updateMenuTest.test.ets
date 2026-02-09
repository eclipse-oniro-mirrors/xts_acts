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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function updateMenuTest() {
  describe('updateMenuTest', () => {
    beforeAll(() => {
      console.info("updateMenuTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("updateMenuTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/updateMenu/updateMenu',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get updateMenuTest state pages:" + JSON.stringify(pages));
        if (!("updateMenu" == pages.name)) {
          console.info("get updateMenuTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push updateMenuTest page error:" + err);
      }
      console.info("updateMenuTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("updateMenuTest after each called");
    });
    /**
     * @tc.number updateMenuTest_0100
     * @tc.name   updateMenuTest_0100
     * @tc.desc   updateMenuTest_0100
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('updateMenuTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('openUpdate'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(5000);
      let updateMenu = inspector.getInspectorByKey('updateMenu');
      let obj = JSON.parseJsonElement(updateMenu);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('updateMenu');
      console.info('updateMenuTest_0100 END ===========================');
      done();
    });
  })
}