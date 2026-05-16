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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextStyleWavy() {
  describe('TextStyleWavy', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStyleWavy beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyleWavy  state pages:" + JSON.stringify(pages));
        if (!("textPageWavy" == pages.name)) {
          console.info("get textPageWavy pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Text/textPageWavy"})
          await CommonFunc.sleep(2000);
          console.info("push textPageWavy page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textPageWavy page error:" + err);
      }
      console.info("TextStyle foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textPageWavy after each called");
    });

    /**
     * @tc.name   TextStyleWavy_001
     * @tc.number TextDecorationStyleTest
     * @tc.desc   TextDecorationStyle.WAVY test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextStyleWavy_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextStyleWavy_001] START');

      let strJson = getInspectorByKey('textWavy');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextStyleWavy_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFF0000","style":"TextDecorationStyle.WAVY"}');
      console.info('[TextStyleWavy_001] END');
      done();

    });

  })
}
