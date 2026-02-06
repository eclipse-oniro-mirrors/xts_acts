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

export default function RichEditorTransformation003() {
  describe('RichEditorTransformation003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTransformation003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTransformation/RichEditorTransformation003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTransformation003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTransformation003" == pages.name)) {
          console.info("get RichEditorTransformation003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTransformation003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTransformation003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_005
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_005
     * @tc.desc  : When there is non textual content in the component, the scaling, translation, and rotation properties set still take effect to test RichEditor AffineTransformation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_005',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_005 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorTransformation003'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditorTransformation003');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      let rotateStr = '{"x":"0.000000","y":"0.000000","z":"1.000000","angle":"100.000000","perspective":"0.000000",' +
        '"centerX":"50.00%","centerY":"50.00%","centerZ":"50.00%"}';
      expect(JSON.stringify(obj.$attrs.rotate)).assertEqual(rotateStr);
      let scaleStr = '{"x":"2.000000","y":"0.500000","centerX":"50.00%","centerY":"50.00%"}';
      expect(JSON.stringify(obj.$attrs.scale)).assertEqual(scaleStr);
      let translateStr = '{"x":"50.00vp","y":"10.00vp","z":"0.00px"}';
      expect(JSON.stringify(obj.$attrs.translate)).assertEqual(translateStr);
      done();
    });

  })
}


