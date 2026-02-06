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
import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';


export default function aboutToAppearFalse() {
  describe('aboutToAppearFalse', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("aboutToAppearFalse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu/aboutToAppearFalse',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get aboutToAppearFalse state pages: " + JSON.stringify(pages));
        if (!("aboutToAppearFalse" == pages.name)) {
          console.info("get aboutToAppearFalse state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push aboutToAppearFalse page error: " + err);
      }

    });
    
    
    /**
     * @tc.number   aboutToAppearFalse_static_0100
     * @tc.name     aboutToAppearFalse_static_0100
     * @tc.desc     aboutToAppearFalse_static_0100
     * @tc.level    Level.LEVEL0
     */
it('aboutToAppearFalse_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('aboutToAppearFalse_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('aboutToAppearFalse'));
      await CommonFunc.sleep(2000);
      console.info('aaaaaa1111111111',button);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('aboutToAppearFalseText');
      await CommonFunc.sleep(1000);
      console.info('bbbbbbbbbb222222222',strJson);

      console.info("[aboutToAppearFalse_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[aboutToAppearFalse_0100] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual("aboutToAppear,onAppear");
      await CommonFunc.sleep(1000);
      console.info('[aboutToAppearFalse_0100] END');
      done();
    });
  })
}

