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

export default function bindContextMenuTest() {
  describe('bindContextMenuTest', () => {
    beforeAll(() => {
      console.info("bindContextMenuTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("bindContextMenuTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindContextMenuTest state pages:" + JSON.stringify(pages));
        if (!("bindContextMenu" == pages.name)) {
          console.info("get  bindContextMenuTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/bindContextMenu/bindContextMenu',
          })
        }
      } catch (err) {
        console.error("push bindContextMenuTest page error:" + err);
      }
      console.info("bindContextMenuTest foreEach end");
    });
    /**
     * @tc.number bindContextMenuTest_static_0001
     * @tc.name   bindContextMenuTest_static_0001
     * @tc.desc   bindContextMenuTest_static_0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('bindContextMenuTest_static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('bindContextMenu0'));
      await (btn?.longClick() as Promise<void>);
      await Utils.sleep(1000);
      let onDidDisappear = inspector.getInspectorByKey('bindContextMenuText0');
      console.info("[bindContextMenuTest_static_0001] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(onDidDisappear).getElement('$attrs')));
      expect(JSON.parseJsonElement(onDidDisappear).getElement('$attrs').getString('content')).assertEqual('true');
      let btn1 = await driver.findComponent(ON.id('bindContextMenuClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number bindContextMenuTest_static_0002
     * @tc.name   bindContextMenuTest_static_0002
     * @tc.desc   bindContextMenuTest_static_0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('bindContextMenuTest_static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('bindContextMenu1'));
      await (btn?.longClick() as Promise<void>);
      await Utils.sleep(1000);
      let onDidDisappear = inspector.getInspectorByKey('bindContextMenuText1');
      console.info("[bindContextMenuTest_static_0002] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(onDidDisappear).getElement('$attrs')));
      expect(JSON.parseJsonElement(onDidDisappear).getElement('$attrs').getString('content')).assertEqual('true');
      let btn1 = await driver.findComponent(ON.id('bindContextMenuClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
    /**
     * @tc.number bindContextMenuTest_static_0003
     * @tc.name   bindContextMenuTest_static_0003
     * @tc.desc   bindContextMenuTest_static_0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('bindContextMenuTest_static_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('bindContextMenu2'));
      await (btn?.longClick() as Promise<void>);
      await Utils.sleep(1000);
      let onDidDisappear = inspector.getInspectorByKey('bindContextMenuText2');
      console.info("[bindContextMenuTest_static_0003] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(onDidDisappear).getElement('$attrs')));
      expect(JSON.parseJsonElement(onDidDisappear).getElement('$attrs').getString('content')).assertEqual('true');
      let btn1 = await driver.findComponent(ON.id('bindContextMenuClose'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      done();
    });
  })
}