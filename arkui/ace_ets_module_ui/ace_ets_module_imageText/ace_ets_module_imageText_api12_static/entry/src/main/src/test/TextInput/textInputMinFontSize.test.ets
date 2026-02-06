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

export default function textInputMinFontSize() {
  describe('textInputMinFontSize', () => {
    beforeAll(() => {
      console.info("textInputMinFontSize beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputMinFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/textInputMinFontSize",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputMinFontSize state pages:" + JSON.stringify(pages));
        if (!("textInputMinFontSize" == pages.name)) {
          console.info("get textInputMinFontSize pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputMinFontSize page error:" + err);
      }
      console.info("textInputMinFontSize beforeEach end");
    }); 


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputMinFontSize after each called");
    })

    
    /**
     * @tc.number   textInputMinFontSize_static_0100
     * @tc.name     textInputMinFontSize_static_0100
     * @tc.desc     textInputMinFontSize_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textInputMinFontSize_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaMinFontSize0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('key_textInput_minFontSize_001');
      console.info('[' + tagName + '] TextInput minFontSize is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('minFontSize')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('minFontSize')).assertEqual('16.00fp');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
