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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let flexGrow = 3;
let compareFlexGrow = 1;
const uiContext = new UIContext();
export default function onDidIMEInputTest() {
  describe('onDidIMEInputTest', () => {
    beforeAll(() => {
      console.info("onDidIMEInputTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("onDidIMEInputTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onDidIMEInput',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onDidIMEInputTest state pages:" + JSON.stringify(pages));
        if (!("onDidIMEInput" == pages.name)) {
          console.info("get onDidIMEInputTest pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push onDidIMEInputTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onDidIMEInputTest page error:" + err);
      }
      console.info("onDidIMEInputTest beforeEach end");
    });

    
    
/**
     * @tc.number   onDidIMEInputTest_static_0010
     * @tc.name     onDidIMEInputTest_static_0010
     * @tc.desc     onDidIMEInputTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('onDidIMEInputTest_static_0010', Level.LEVEL0, async (done: ()=>void) => {
      console.info('onDidIMEInputTest_0010 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditor: Component|null = await driver.findComponent(ON.id('RichEditor_OnDidIMEInput'));
      await (RichEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (RichEditor?.inputText('123') as Promise<void>);
      await CommonFunc.sleep(1000);

        let onDidIMEInputTest_1 = inspector.getInspectorByKey('OnDidIMEInput_id');
        expect(JSON.parseJsonElement(onDidIMEInputTest_1).getElement('$attrs').getString('content') + "").assertEqual("onDidIMEInput succ");

      console.info('onDidIMEInputTest_0010 END');
      done();
    });
  })
}