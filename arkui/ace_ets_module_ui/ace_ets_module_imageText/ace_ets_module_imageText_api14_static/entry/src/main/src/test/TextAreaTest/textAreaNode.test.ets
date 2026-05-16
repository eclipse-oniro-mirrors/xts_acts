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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets";
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function TextAreaNodeTest() {
  describe('TextAreaNodeTest', () => {
    beforeAll(() => {
      console.info("TextAreaNodeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaNode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get TextAreaNodeTest state pages:" + "");
        if (!("textAreaNode" == pages.name)) {
          console.info("get TextAreaNodeTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaNodeTest page error:" + err);
      }
      console.info("TextAreaNodeTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaNode after each called");
    })

    

    /**
     * @tc.number   textAreaNode_static_0100
     * @tc.name     textAreaNode_static_0100
     * @tc.desc     textAreaNode_static_0100
     * @tc.level    Level.LEVEL0
     */
it('textAreaNode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      let tagName = 'textAreaNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_textArea_Node_001');
      console.info('[' + tagName + '] Search fontSize is: ' + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize'));
      console.info('[' + tagName + '] Search width is: ' + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('width'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    

    

    /**
     * @tc.number   textAreaNode_static_0200
     * @tc.name     textAreaNode_static_0200
     * @tc.desc     textAreaNode_static_0200
     * @tc.level    Level.LEVEL0
     */
it('textAreaNode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaNode0200';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_textArea_Node_001');
      console.info('[' + tagName + '] Search fontStyle is: ' + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontStyle'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    

    

    /**
     * @tc.number   textAreaNode_static_0300
     * @tc.name     textAreaNode_static_0300
     * @tc.desc     textAreaNode_static_0300
     * @tc.level    Level.LEVEL0
     */
it('textAreaNode_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaNode0300';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_textArea_Node_001');
      console.info('[' + tagName + '] Search textAlign is: ' + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('textAlign'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
