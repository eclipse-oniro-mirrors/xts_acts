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

export default function textInputLineHeight() {
  describe('textInputLineHeight', () => {
    beforeAll(() => {
      console.info("textInputLineHeight beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputLineHeight beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/textInputLineHeight",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textInputLineHeight state pages:" + JSON.stringify(pages));
        if (!("textInputLineHeight" == pages.name)) {
          console.info("get textInputLineHeight pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputLineHeight page error:" + err);
      }
      console.info("textInputLineHeight beforeEach end");
    }); 


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputLineHeight after each called");
    })

    
    /**
     * @tc.number   textInputLineHeight_static_0100
     * @tc.name     textInputLineHeight_static_0100
     * @tc.desc     textInputLineHeight_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textInputLineHeight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textInputLineHeight_0100] START');
      let strJson = inspector.getInspectorByKey('key_textInput_lineHeight_001');
      console.info("[textInputLineHeight_0100] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual('30.00fp');
      console.info('[textInputLineHeight_0100] END');
      done();
    });
  })
}
