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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function textInputPreview() {
  describe('textInputPreview', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputPreview beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInputPreview',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputPreview state pages: " + JSON.stringify(pages));
        if (!("textInputPreview" == pages.name)) {
          console.info("get textInputPreview state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push textInputPreview success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputPreview page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textInputPreview_0100
     * @tc.number SUB_ACE_TextInput_Preview_0100
     * @tc.desc   Define the preview text mode of the text input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputPreview_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('textInputPreview_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('enablePreview_textInput');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInputPreview_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textInputPreview_0100] enablePreviewText: " + JSON.stringify(obj.$attrs.enablePreviewText));
      expect(obj.$attrs.enablePreviewText).assertEqual(true);
      console.info('[textInputPreview_0100] END');
      done();
    });

  })
}