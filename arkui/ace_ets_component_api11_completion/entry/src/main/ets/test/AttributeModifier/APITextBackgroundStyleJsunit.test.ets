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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';

export default function APITextBackgroundStyleJsunit() {
  describe('APITextBackgroundStyleJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("APITextBackgroundStyleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeModifier/APITextBackgroundStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APITextBackgroundStyleJsunit state pages:" + JSON.stringify(pages));
        if (!("APITextBackgroundStyle" == pages.name)) {
          console.info("get APITextBackgroundStyleJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push APITextBackgroundStyleJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APITextBackgroundStyleJsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    it('APITextBackgroundStyleJsunit_0100', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('APITextBackgroundStyleJsunit_0100 START');
      let strcontent = getInspectorByKey('APITextBackgroundStyleSpan');
      await CommonFunc.sleep(1000);
      console.info('APITextBackgroundStyleJsunit_0100 component obj is: ' + JSON.parse(strcontent));
      console.info('APITextBackgroundStyleJsunit_0100 component obj.$attrs is: ' + JSON.parse(strcontent).$attrs);
      console.info('APITextBackgroundStyleJsunit_0100 component obj.$attrs.textBackgroundStyle is: ' + JSON.parse(strcontent).$attrs.textBackgroundStyle.color);
      expect(JSON.parse(strcontent).$attrs.textBackgroundStyle.color).assertEqual('#FF209B08');
      console.info('APITextBackgroundStyleJsunit_0100 END')
      done();
    });
  })
}