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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function MultiNavigation20() {
  describe('MultiNavigation20', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("MultiNavigation20 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavigation20',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MultiNavigation20 state pages:" + JSON.stringify(pages));
        if (!("MultiNavigation20" == pages.name)) {
          console.info("get MultiNavigation20 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavigation20 page result:");
        }
      } catch (err) {
        console.error("push MultiNavigation20 page error:" + err);
      }
      console.info("MultiNavigation20 beforeEach end");
    });
    afterEach(async () => {
    });

    
    

    /**
     * @tc.number   MultiNavigation20_static_0100
     * @tc.name     MultiNavigation20_static_0100
     * @tc.desc     MultiNavigation20_static_0100
     * @tc.level    Level.LEVEL0
     */
it('MultiNavigation20_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('MultiNavigation20_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('MultiNavigation20_btn1',10,"")
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn2',10,"")
      await CommonFunc.sleep(1000);
      let text2 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text2).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn3',10,"")
      await CommonFunc.sleep(1000);
      let text3 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text3).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn4',10,"")
      await CommonFunc.sleep(1000);
      let text4 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text4).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn5',10,"")
      await CommonFunc.sleep(1000);
      let text5 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text5).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn6',10,"")
      await CommonFunc.sleep(1000);
      let text6 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text6).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn7',10,"")
      await CommonFunc.sleep(1000);
      let text7 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text7).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn8',10,"")
      await CommonFunc.sleep(1000);
      let text8 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text8).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      inspector.sendEventByKey('MultiNavigation20_btn9',10,"")
      await CommonFunc.sleep(1000);
      let text9 = inspector.getInspectorByKey('MultiNavigation20_text1');
      expect(String(JSON.parseJsonElement(text9).getElement('$attrs').getString('content'))).assertEqual('["PageHome1"]');

      console.info('MultiNavigation20_static_0100 END');
      done();
    });

  })
}