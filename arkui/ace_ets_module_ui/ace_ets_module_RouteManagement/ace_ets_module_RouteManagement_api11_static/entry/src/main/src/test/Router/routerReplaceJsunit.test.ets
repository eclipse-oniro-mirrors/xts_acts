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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function routerReplaceJsunit() {
  describe('routerReplaceJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("routerReplaceJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/routerReplace',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get routerReplaceJsunit state pages:" + JSON.stringify(pages));
        if (!("routerReplace" == pages.name)) {
          console.info("get routerReplaceJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push routerReplaceJsunit page error:" + err);
      }
      console.info("routerReplaceJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerReplaceJsunit after each called");
    });

    
    
/**
     * @tc.number   routerReplaceJsunit_static_0100
     * @tc.name     routerReplaceJsunit_static_0100
     * @tc.desc     routerReplaceJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('routerReplaceJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[routerReplaceJsunit_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('router_replaceUrl_btn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text = inspector.getInspectorByKey('replace_getParams');
      expect(JSON.parseJsonElement(text)!.getElement('$attrs').getString('content')).assertEqual('router_replaceUrl:undefined');
      console.info('[routerReplaceJsunit_static_0100] END');
      done();
    });

  })
}