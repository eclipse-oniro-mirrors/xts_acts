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

export default function TextSelectableJsunit() {
  describe('TextSelectableJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSelectableJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextSelectable',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSelectableJsunit state pages: " + JSON.stringify(pages));
        if (!("TextSelectable" == pages.name)) {
          console.info("get TextSelectableJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSelectableJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSelectableJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" TextSelectableJsunit after each called");
    });

    /**
     * @tc.name   textSelectableJsunit_0100
     * @tc.number SUB_ACE_Text_TEXTSELECTABLE_0100
     * @tc.desc   set text selectable and focusable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textSelectableJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('textSelectableJsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textSelectable_mess');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textSelectableJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textSelectableJsunit_0100] textSelectable: " + JSON.stringify(obj.$attrs.textSelectable));
      expect(obj.$attrs.textSelectable).assertEqual('selectable-focusable');
      console.info('[textSelectableJsunit_0100] END');
      done();
    });

  })
}