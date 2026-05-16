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
  TextCase
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter'
import Utils from '../Utils.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { MessageManagerBase } from '../../../ets/MainAbility/common/MessageManager2';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textTextCaseTest() {
  describe('textTextCaseTest',  ()=> {
    beforeAll(() => {
      console.info("textTextCaseTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textTextCaseTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textTextCase',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textTextCaseTest state pages:" + JSON.stringify(pages));
        if (!("textTextCase" == pages.name)) {
          console.info("get textTextCaseTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textTextCaseTest page error:" + err);
      }
      console.info("textTextCaseTest beforeEach end");
    });


    
    /**
     * @tc.number   textTextCase_static_0100
     * @tc.name     textTextCase_static_0100
     * @tc.desc     textTextCase_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('textTextCase_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextCase_static_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(2000);

      try {
        AppStorage.get<MessageManagerBase<TextCase>>("messageManagerTextCase")?.notify({
          name: 'textCase', value: TextCase.Normal
        });
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_text_textCase');
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text textCase is: ' + JSON.stringify(obj.getElement('$attrs').getString('textCase')));

      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textTextCase_static_0200
     * @tc.name     textTextCase_static_0200
     * @tc.desc     textTextCase_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('textTextCase_static_0200', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextCase_static_0200';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(2000);

      try {
        AppStorage.get<MessageManagerBase<TextCase>>("messageManagerTextCase")?.notify({
          name: 'textCase', value: TextCase.LowerCase
        });
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_text_textCase');
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text textCase is: ' + JSON.stringify(obj.getElement('$attrs').getString('textCase')));

      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.LowerCase');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textTextCase_static_0300
     * @tc.name     textTextCase_static_0300
     * @tc.desc     textTextCase_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('textTextCase_static_0300', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextCase_static_0300';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(2000);
        
      try {
        AppStorage.get<MessageManagerBase<TextCase>>("messageManagerTextCase")?.notify({
          name: 'textCase', value: TextCase.UpperCase
        });

      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
    
      let strJsonNew = inspector.getInspectorByKey('key_text_textCase');
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text textCase is: ' + JSON.stringify(obj.getElement('$attrs').getString('textCase')));

      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
        
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
