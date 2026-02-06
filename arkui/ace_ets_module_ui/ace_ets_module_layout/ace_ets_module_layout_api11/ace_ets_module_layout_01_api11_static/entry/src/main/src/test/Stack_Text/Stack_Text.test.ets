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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Alignment } from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { UtilsTest, startAbility } from '../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import { MessageManager } from '../../../ets/MainAbility/common/MessageManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../ets/MainAbility/common/Common';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function Stack_Text() {
  describe('Stack_Text', () => {
    beforeAll(async () => {
      console.info("Stack_Text beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      console.info("Stack_Text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack_Text/Stack_Text',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Stack_Text state pages: " + JSON.stringify(pages));
        if (!("Stack_Text" == pages?.name)) {
          console.info("get Stack_Text state pages.name: " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          // let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Stack_Text page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_Text page error: " + err);
        expect().assertFail();
      }
      // done();
    });


    /**
     * @tc.number  Stack_Text_001_static
     * @tc.name     Stack_Text_001_static
     * @tc.desc     Stack_Text_001_static
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Text_001_static', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[Stack_Text_001_static] START');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('Stack_TextInput');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_001_static] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.getElement('$attrs').getString('type')).assertEqual('InputType.USER_NAME');
      console.info('[Stack_Text_001_static] END');
      done();
    });


    /**
     * @tc.number  Stack_Text_002_static
     * @tc.name     Stack_Text_002_static
     * @tc.desc     Stack_Text_002_static
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Text_002_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Stack_Text_002_static] START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Stack_Text_Button1');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_002_static] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('controlSize')).assertEqual('ControlSize.SMALL');
      expect(obj1.getElement('$attrs').getString('buttonStyle')).assertEqual('ButtonStyleMode.EMPHASIZED');
      console.info('[Stack_Text_002_static] END');
      done();
    });


    /**
     * @tc.number  Stack_Text_003_static
     * @tc.name     Stack_Text_003_static
     * @tc.desc     Stack_Text_003_static
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Text_003_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Stack_Text_003_static] START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Stack_Text_Button2');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_003_static] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('controlSize')).assertEqual('ControlSize.NORMAL');
      expect(obj1.getElement('$attrs').getString('buttonStyle')).assertEqual('ButtonStyleMode.NORMAL');
      console.info('[Stack_Text_003_static] END');
      done();
    });


    /**
     * @tc.number  Stack_Text_004_static
     * @tc.name     Stack_Text_004_static
     * @tc.desc     Stack_Text_004_static
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Text_004_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Stack_Text_004_static] START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Stack_Text_Button3');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_004_static] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('buttonStyle')).assertEqual('ButtonStyleMode.TEXTUAL');
      console.info('[Stack_Text_004_static] END');
      done();
    });


    /**
     * @tc.number  Stack_Text_005_static
     * @tc.name     Stack_Text_005_static
     * @tc.desc     Stack_Text_005_static
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Text_005_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Stack_Text_005_static] START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Stack_Text');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_005_static] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('15544889999');
      console.info('[Stack_Text_005_static] END');
      done();
    });


    /**
     * @tc.number  Stack_Text_static_006
     * @tc.name     Stack_Text_static_006
     * @tc.desc     Stack_Text_static_006
     * @tc.level    Level.LEVEL0
     */
    it('Stack_Text_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[Stack_Text_006] START');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('Stack_TextInput');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_006] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.getElement('$attrs').getBoolean('enableAutoFill')).assertEqual(true);
      console.info('[Stack_Text_006] END');
      done();
    });


  })
}
