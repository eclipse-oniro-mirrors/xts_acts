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
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
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

export default function richEditorApi2() {
  describe('richEditorApi2', () => {
    beforeEach(async (): Promise<void> => {
      console.info("richEditorApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/richEditorApi/richEditorApi2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get richEditorApi2 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi2" == pages.name)) {
          console.info("get richEditorApi2 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push richEditorApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi2 page error:" + err);
      }
      console.info("richEditorApi2 beforeEach end");
    });
    beforeAll(() => {
      console.info("richEditorApi2 beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi2 after each called");
    });

    
    /**
     * @tc.number   richEditorApi2_static_0100
     * @tc.name     richEditorApi2_static_0100
     * @tc.desc     richEditorApi2_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('richEditorApi2_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[richEditorApi2_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('richEditorApi2_btn1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[richEditorApi2_0100] richEditorApi2_btn1 click');


      let btn2 = await driver.findComponent(ON.id('richEditorApi2_btn2'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[richEditorApi2_0100] richEditorApi2_btn2 click');

      let text1 = inspector.getInspectorByKey('richEditorApi2_text1');
      let obj = JSON.parseJsonElement(text1);
      const contentElement = JSON.parseJsonElement(obj.getElement('$attrs').getString('content'))

      expect(JSON.stringifyJsonElement(contentElement.getArray("size")[0])).assertEqual("80")
      expect(JSON.stringifyJsonElement(contentElement.getArray("size")[1])).assertEqual("80")
      expect(contentElement.getDouble("verticalAlign")).assertEqual(3)
      expect(contentElement.getDouble("objectFit")).assertEqual(1)
      expect(contentElement.getElement("layoutStyle").getElement("margin").getString("top")).assertEqual("0.00px")
      expect(contentElement.getElement("layoutStyle").getElement("margin").getString("right")).assertEqual("0.00px")
      expect(contentElement.getElement("layoutStyle").getElement("margin").getString("bottom")).assertEqual("0.00px")
      expect(contentElement.getElement("layoutStyle").getElement("margin").getString("left")).assertEqual("0.00px")
      expect(contentElement.getElement("layoutStyle").getString("borderRadius")).assertEqual("50.00px")
      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
