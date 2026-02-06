'use static';
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

import Utils from '../../../ets/MainAbility/common/Utils';
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function selectDividerTest() {
  console.info('selectDividerTest beforeEach start');
  describe('selectDividerTest', () => {
    beforeAll(() => {
      console.info("selectDividerTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("selectDividerTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get selectDividerTest state pages:" + JSON.stringify(pages));
        if (!("selectDividerTest" == pages.name)) {
          console.info("get  selectDividerTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/selectDivider/selectDividerTest',
          })
        }
      } catch (err) {
        console.error("push selectDividerTest page error:" + err);
      }
      console.info("selectDividerTest foreEach end");
    });

    
    
/**
     * @tc.number   selectDividerTest_static_001
     * @tc.name     selectDividerTest_static_001
     * @tc.desc     selectDividerTest_static_001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('selectDividerTest_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('selectDividerTest_static_001 START');
        let driver = Driver.create()
        await Utils.sleep(1000);
        let button = await driver.findComponent(ON.id('selectmode'));
        await (button?.click() as Promise<void>);
        await Utils.sleep(1000);

        let strJson = inspector.getInspectorByKey('selectmode');
        let obj = JSON.parseJsonElement(strJson);
        console.info("selectDividerTest_static_001 obj is: " + JSON.stringify(obj));
        console.info("[selectDividerTest_static_001] obj: " + JSON.stringify(obj.getElement('$attrs')));
        console.info("[selectDividerTest_static_001] getString('divider'): " +
        JSON.stringify(obj.getElement('$attrs').getString('divider')));
        console.info("[selectDividerTest_static_001] DividerMode: " +
        JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'));
        expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'))
          .assertEqual("FLOATING_ABOVE_MENU");
        await Utils.sleep(1000);
        await (driver.click(
          Math.round((AppStorage.get<Int>('winLeft') ?? 0 as Int) + 20) as Int,
          Math.round((AppStorage.get<Int>('winTop') ?? 0 as Int) + 200) as Int
        ) as Promise<void>);
        await Utils.sleep(1000);
        console.info('selectDividerTest_static_001 END');
        done();
      });

    
    
/**
     * @tc.number   selectDividerTest_static_002
     * @tc.name     selectDividerTest_static_002
     * @tc.desc     selectDividerTest_static_002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('selectDividerTest_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('selectDividerTest_static_002 START');
        let driver = Driver.create()
        await Utils.sleep(1000);
        let button = await driver.findComponent(ON.id('selectmode1'));
        await (button?.click() as Promise<void>);
        await Utils.sleep(1000);

        let strJson = inspector.getInspectorByKey('selectmode1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("selectDividerTest_static_002 obj is: " + JSON.stringify(obj));
        console.info("[selectDividerTest_static_002] obj: " + JSON.stringify(obj.getElement('$attrs')));
        console.info("[selectDividerTest_static_002] divider: " +
        JSON.stringify(obj.getElement('$attrs').getString('divider')));
        console.info("[selectDividerTest_static_002] DividerMode: " +
        JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'));
        expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('divider')).getString('dividerMode'))
          .assertEqual("EMBEDDED_IN_MENU");
        await Utils.sleep(1000);
        console.info('selectDividerTest_static_002 END');
        done();
      });
  }
  )
}
