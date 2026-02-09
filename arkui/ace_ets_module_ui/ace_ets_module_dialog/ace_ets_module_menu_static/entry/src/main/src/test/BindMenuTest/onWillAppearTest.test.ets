'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../../hypium/index";
import router from '@ohos.router';
import drawing from '@ohos.graphics.drawing';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function onWillAppearTest() {
  describe('onWillAppearTest', () => {
    beforeAll(() => {
      console.info("onWillAppearTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("onWillAppearTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onWillAppearTest state pages:" + JSON.stringify(pages));
        if (!("onWillAppear" == pages.name)) {
          console.info("get  onWillAppearTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/bindMenu/onWillAppear',
          })
        }
      } catch (err) {
        console.error("push onWillAppearTest page error:" + err);
      }
      console.info("onWillAppearTest foreEach end");
    });
    /**
     * @tc.number onWillAppearTest_static_0001
     * @tc.name   onWillAppearTest_static_0001
     * @tc.desc   onWillAppearTest_static_0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('onWillAppearTest_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('onWillAppearBindMenu'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let onWillAppear = inspector.getInspectorByKey('onWillAppearBindMenuText');
      console.info("[onWillAppearTest_static_0100] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(onWillAppear).getElement('$attrs')));
      expect(JSON.parseJsonElement(onWillAppear).getElement('$attrs').getString('content')).assertEqual('true');
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
  })
}