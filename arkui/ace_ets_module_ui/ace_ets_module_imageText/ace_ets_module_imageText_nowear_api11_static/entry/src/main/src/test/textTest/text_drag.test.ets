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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON,Component} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
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
export default function text_drag() {
  describe('text_drag', () :void=> {
    beforeAll(() => {
      console.info("text_drag beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("text_drag beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/text/TextDrag",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get text_drag state pages:" + "");
        if (!("TextDrag" == pages.name)) {
          console.info("get text_drag pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push text_drag page error:" + err);
      }
      console.info("text_drag beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("text_drag after each called");
    });
    

    
    /**
     * @tc.number   SUB_ACE_UI_TEXT_DRAG_static_0100
     * @tc.name     SUB_ACE_UI_TEXT_DRAG_static_0100
     * @tc.desc     SUB_ACE_UI_TEXT_DRAG_static_0100
     * @tc.level    Level.LEVEL1
     */
it('SUB_ACE_UI_TEXT_DRAG_static_0100', Level.LEVEL1, async (done: ()=>void) => {

  console.info('[text_drag_001] START');
  let driver = Driver.create();
  let textComponent = await (driver.findComponent(ON.id('DraggedText')) as Promise<Component>);
  //first step: longClick
  await textComponent.longClick();
  await CommonFunc.sleep(2000);
  console.info('[text_drag_001] longClick success');
  let selectAllButton = await (driver.findComponent(ON.text('全选')) as Promise<Component>);
  await (selectAllButton?.click() as Promise<void>);
  await CommonFunc.sleep(300);
  let strJson1 = inspector.getInspectorByKey('DraggedText');
  console.info(`[text_drag_001] DraggedText strJson1 is:${strJson1}`);
  let obj1 = JSON.parseJsonElement(strJson1);
  console.info(`[text_drag_001] DraggedText selection range is:${obj1.getElement('$attrs').getString('selection')}`);
  await CommonFunc.sleep(300);
  expect(obj1.getElement('$attrs').getString('selection')).assertEqual('[0,45]');

  //second step: drag text to textArea
  let textAreaComponent = await (driver.findComponent(ON.id('textAreaDrag')) as Promise<Component>);
  console.info(`[text_drag_001] textAreaComponent is:${JSON.stringify(textAreaComponent)}`);
  await textComponent!.dragTo(textAreaComponent);
  await CommonFunc.sleep(2000);
  console.info(`[text_drag_001] dragTo is: success}`);
  let strJson2 = inspector.getInspectorByKey('DraggedText');
  console.info(`[text_drag_001] DraggedText strJson2 is:${strJson2}`);
  let obj2 = JSON.parseJsonElement(strJson2);
  console.info(`[text_drag_001] after dragging text, selection range is:${obj2.getElement('$attrs').getString('selection')}`);
  await CommonFunc.sleep(300);
  expect(obj2.getElement('$attrs').getString('selection')).assertEqual('[-1,-1]');
  let textAreaContent = await textAreaComponent.getText();
  expect(textAreaContent).assertEqual('test drag event draggable设为true, 有onDragStart');

  console.info('[text_drag_001] END');
  done();
    });
    
  })
}