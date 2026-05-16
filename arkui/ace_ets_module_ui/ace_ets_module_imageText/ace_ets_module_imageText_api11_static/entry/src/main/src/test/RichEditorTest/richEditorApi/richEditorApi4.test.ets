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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function richEditorApi4() {
  describe('richEditorApi4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("richEditorApi4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/richEditorApi/richEditorApi4",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get richEditorApi4 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi4" == pages.name)) {
          console.info("get richEditorApi4 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push richEditorApi4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi4 page error:" + err);
      }
      console.info("richEditorApi4 beforeEach end");
    });
    beforeAll(() => {
      console.info("richEditorApi4 beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi4 after each called");
    });
    
    /**
     * @tc.number   richEditorApi4_static_0100
     * @tc.name     richEditorApi4_static_0100
     * @tc.desc     richEditorApi4_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('richEditorApi4_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[richEditorApi4_0100] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('richEditorApi4_btn1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('richEditorApi4_btn2'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('richEditorApi4_text1');
      let obj1 = JSON.parseJsonElement(text1);

      let content  = JSON.parseJsonElement(obj1.getElement('$attrs').getString('content'));
      console.log("======================================== " + obj1.getElement('$attrs').getString('content') )
      console.info('[richEditorApi4_0100] content:' + content.getElement('fontSize'));
      console.info('[richEditorApi4_0100] content:' + content.getElement('fontColor'));
      console.info('[richEditorApi4_0100] content:' + content.tryGetString('fontFeature'));
      console.info('[richEditorApi4_0100] content:' + content.getElement('decoration').getDouble('type'));
      console.info('[richEditorApi4_0100] content:' + content.getElement('decoration').getString('color'));
      expect('' + content.getString('fontSize')).assertEqual('50.00vp');
      expect('' + content.getString('fontColor')).assertEqual('#FF182431');
      expect('' + content.tryGetString('fontFeature')).assertEqual('');
      expect('' + content.getElement('decoration').getDouble('type')).assertEqual('0');
      expect(content.getElement('decoration').getString('color')).assertEqual('#FF182431');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
