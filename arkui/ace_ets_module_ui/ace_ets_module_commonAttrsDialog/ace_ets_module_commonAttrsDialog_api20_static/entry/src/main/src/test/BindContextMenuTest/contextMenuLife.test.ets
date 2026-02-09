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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium'
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ContextMenuLife() {
  describe('ContextMenuLife', () => {
    const SLEEP_TIME_1000 = 1000;
    const SLEEP_TIME_2000 = 2000;
    beforeAll(() => {
      console.info("BindContextMenu beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("BindContextMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindContextMenu/contextMenuLife',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BindContextMenu state pages:" + JSON.stringify(pages));
        if (!("contextMenuLife" == pages.name)) {
          console.info("get BindContextMenu pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BindContextMenu page error:" + err);
      }
      console.info("BindContextMenu beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('BindMenu after each called');
    })

    /**
     * @tc.number   contextMenu_static_0010
     * @tc.name     contextMenu_static_0010
     * @tc.desc     contextMenu_static_0010
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('contextMenu_static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[contextMenu_static_0010] START');
        let driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME_1000);
        let button = await driver.findComponent(ON.id('showID'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_1000);

        let strJson = inspector.getInspectorByKey('appearText1');
        let disappStrJson = inspector.getInspectorByKey('disappearText1');
        let content: String = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
        let disappContent: String = JSON.parseJsonElement(disappStrJson).getElement('$attrs').getString('content');
        console.info('[contextMenu_static_0010] content is: ' + content);
        console.info('[contextMenu_static_0010] disappContent is: ' + disappContent);
        expect(content).assertEqual('onWillAppear_onDidAppear');
        expect(disappContent).assertEqual('');

        await CommonFunc.sleep(SLEEP_TIME_2000);
        disappStrJson = inspector.getInspectorByKey('disappearText1');
        disappContent = JSON.parseJsonElement(disappStrJson).getElement('$attrs').getString('content');
        console.info('[contextMenu_static_0010] disappContents is: ' + disappContent);
        expect(disappContent).assertEqual('onWillDisappear_onDidDisappear');
        console.info('[contextMenu_static_0010] END');
        done();
      });
  })
}