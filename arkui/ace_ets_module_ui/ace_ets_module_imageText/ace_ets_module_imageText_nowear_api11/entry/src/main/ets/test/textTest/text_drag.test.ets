/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function text_drag() {
  describe('text_drag', () => {
    beforeEach(async (done: Function) => {
      console.info("text_drag beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextDrag',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get text_drag state pages: " + JSON.stringify(pages));
        if (!("TextDrag" == pages.name)) {
          console.info("get text_drag state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push text_drag page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push text_drag page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_TEXT_DRAG_0100
     * @tc.number SUB_ACE_UI_TEXT_DRAG_0100
     * @tc.desc   After longClick on Text Component, drag text and check text state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_TEXT_DRAG_0100', Level.LEVEL1, async (done: Function) => {

      console.info('[text_drag_001] START');
      let driver = Driver.create();
      let textComponent = await driver.findComponent(ON.id('DraggedText'));
      //first step: longClick
      await textComponent.longClick();
      await CommonFunc.sleep(500);
      console.info('[text_drag_001] longClick success');
      let selectAllButton = await driver.findComponent(ON.text('全选'));
      selectAllButton?.click();
      await CommonFunc.sleep(300);
      let strJson1 = getInspectorByKey('DraggedText');
      console.info(`[text_drag_001] DraggedText strJson1 is:${strJson1}`);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`[text_drag_001] DraggedText selection range is:${obj1.$attrs.selection}`);
      await CommonFunc.sleep(300);
      expect(obj1.$attrs.selection).assertEqual('[0,45]');

      //second step: drag text to textArea
      let textAreaComponent = await driver.findComponent(ON.id('textAreaDrag'));
      await textComponent.dragTo(textAreaComponent);
      let strJson2 = getInspectorByKey('DraggedText');
      console.info(`[text_drag_001] DraggedText strJson2 is:${strJson2}`);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`[text_drag_001] after dragging text, selection range is:${obj2.$attrs.selection}`);
      await CommonFunc.sleep(300);
      expect(obj2.$attrs.selection).assertEqual('[-1,-1]');
      let textAreaContent = await textAreaComponent.getText();
      expect(textAreaContent).assertEqual('test drag event draggable设为true, 有onDragStart');

      console.info('[text_drag_001] END');
      done();
    });
    
  })
}