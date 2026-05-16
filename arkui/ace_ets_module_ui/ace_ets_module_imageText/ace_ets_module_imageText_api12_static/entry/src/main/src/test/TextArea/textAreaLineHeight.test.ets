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

export default function textAreaLineHeight() {
  describe('textAreaLineHeight', () => {
    beforeAll(() => {
      console.info("textAreaLineHeight beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaLineHeight beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaLineHeight",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaLineHeight state pages:" + JSON.stringify(pages));
        if (!("textAreaLineHeight" == pages.name)) {
          console.info("get textAreaLineHeight pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaLineHeight page error:" + err);
      }
      console.info("textAreaLineHeight beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaLineHeight after each called");
    })

    
    /**
     * @tc.number   textAreaLineHeight_static_0100
     * @tc.name     textAreaLineHeight_static_0100
     * @tc.desc     textAreaLineHeight_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textAreaLineHeight_static_0100', Level.LEVEL0, async  (done: () => void): Promise<void> => {
      console.info('[textAreaLineHeight_0100] START');
      let strJson = inspector.getInspectorByKey('key_textArea_lineHeight_001');
      console.info("[textAreaLineHeight_0100] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual('30.00fp');
      console.info('[textAreaLineHeight_0100] END');
      done();
    });
  })
}
