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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';

export default function RichEditorParticiple001() {
  describe('RichEditorParticiple001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorParticiple001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomColors/RichEditorParticiple001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorParticiple001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorParticiple001" == pages.name)) {
          console.info("get RichEditorParticiple001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorParticiple001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorParticiple001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_AI_PARTICIPLE_0050
     * @tc.name  : SUB_ACE_UI_AI_PARTICIPLE_0050
     * @tc.desc  : Set the RichEditor graphic mixing to test the RichEditor content Click the result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('SUB_ACE_UI_AI_PARTICIPLE_0050',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_AI_PARTICIPLE_0050 START');
      let driver = Driver.create();

      let richEditor = await driver.findComponent(ON.id('RichEditorParticiple001'));
      let pointCenter = await richEditor.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let select = await driver.findComponent(ON.id('select'))
      await select?.click()
      await CommonFunc.sleep(1000);

      await driver.findComponent(ON.text('复制'))
      await CommonFunc.sleep(1000);
      let obj = getInspectorByKey('select');
      let Obj1: ESObject = JSON.parse(obj);
      expect(Obj1.$type).assertEqual('Button');
      done();
    });

  })
}


