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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../TextInput/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textInputMaxFontSize() {
  describe('textInputMaxFontSize', () => {
    beforeAll(() => {
      console.info("textInputMaxFontSize beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputMaxFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/textInputMaxFontSize",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputMaxFontSize state pages:" + JSON.stringify(pages));
        if (!("textInputMaxFontSize" == pages.name)) {
          console.info("get textInputMaxFontSize pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputMaxFontSize page error:" + err);
      }
      console.info("textInputMaxFontSize beforeEach end");
    }); 


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputMaxFontSize after each called");
    })

    
    /**
     * @tc.number   textInputMaxFontSize_static_0100
     * @tc.name     textInputMaxFontSize_static_0100
     * @tc.desc     textInputMaxFontSize_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textInputMaxFontSize_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textInputMaxFontSize0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('key_textInput_maxFontSize_001');
      console.info('[' + tagName + '] TextInput maxFontSize is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('maxFontSize')));


      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('maxFontSize')).assertEqual('21.00fp');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
