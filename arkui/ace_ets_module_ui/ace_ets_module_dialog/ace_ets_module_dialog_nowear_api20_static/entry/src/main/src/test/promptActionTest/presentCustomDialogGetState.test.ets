'use static';
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

export default function PresentCustomDialogGetStateTest() {
  describe('PresentCustomDialogGetStateTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(() => {
      console.info("PresentCustomDialogGetStateTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("PresentCustomDialogGetStateTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PresentCustomDialogGetStateTest state pages:" + JSON.stringify(pages));
        if (!("presentCustomDialogGetState" == pages.name)) {
          console.info("get  PresentCustomDialogGetStateTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/promptAction/presentCustomDialogGetState',
          })
        }
      } catch (err) {
        console.error("push PresentCustomDialogGetStateTest page error:" + err);
      }
      console.info("PresentCustomDialogGetStateTest foreEach end");
    });

    /**
     * @tc.number   PresentCustomDialogGetStateTest_static_0100
     * @tc.name     PresentCustomDialogGetStateTest_static_0100
     * @tc.desc     Test the getState interface
     * @tc.level    LEVEL0
     */
    it('PresentCustomDialogGetStateTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'PresentCustomDialogGetStateTest_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create()
      let btn = await driver.findComponent(ON.id('presentCustomDialog001'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson1 = inspector.getInspectorByKey('presentCustomDialogFlag1');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('1');
      await Utils.sleep(SLEEP_TIME_1000)
      let strJson2 = inspector.getInspectorByKey('presentCustomDialogFlag2');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('2');
      let btn2 = await driver.findComponent(ON.text('close dialog'));
      await (btn2?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_1000)
      let strJson3 = inspector.getInspectorByKey('presentCustomDialogFlag3');
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('3');
      await Utils.sleep(SLEEP_TIME_1000)
      let strJson4 = inspector.getInspectorByKey('presentCustomDialogFlag4');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual('4');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}