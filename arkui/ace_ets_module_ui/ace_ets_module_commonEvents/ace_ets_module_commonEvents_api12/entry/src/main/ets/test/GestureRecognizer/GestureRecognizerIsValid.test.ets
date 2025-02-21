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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function GestureRecognizerIsValid() {
  describe('GestureRecognizerIsValid', () => {
    beforeEach(async (done: Function) => {
      console.info("GestureRecognizerIsValid beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureRecognizerIsValid state pages:" + JSON.stringify(pages));
        if (!("GestureRecognizerIsValid" == pages.name)) {
          console.info("get  GestureRecognizerIsValid pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/GestureRecognizer/GestureRecognizerIsValid"
          })
          await CommonFunc.sleep(2000);
          console.info("push GestureRecognizerIsValid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureRecognizerIsValid page error:" + err);
      }
      console.info("GestureRecognizerIsValid foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GestureRecognizerIsValid after each called");
    });

    /**
     * @tc.number GestureRecognizerIsValid_001
     * @tc.name   GestureRecognizerIsValid_001
     * @tc.desc Test api isValid of GestureRecognizer
     * @tc.level Level 2
     */

    it('GestureRecognizerIsValid_001', 0, async (done: Function) => {
      console.info('[GestureRecognizerIsValid_001] START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('FatherControlChildTest1_inner_0');
      let areaHeight = areaObj1.bottom - areaObj1.top
      let areaWidth = areaObj1.right - areaObj1.left
      console.log('GestureRecognizerIsValid_001 item height and width',areaHeight, areaWidth)
      // child scroll
      let driver = Driver.create();
      await driver.swipe(Math.round(areaObj1.left + areaWidth/2), Math.round(areaObj1.bottom - areaHeight * 0.2) , Math.round(areaObj1.left + areaWidth/2), Math.round(areaObj1.top));
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('recognizer_text');
      console.info('[GestureRecognizerIsValid_001] component strJson1 is: ' + JSON.stringify(JSON.parse(strJson1)));
      console.info('[GestureRecognizerIsValid_001] strJson1 content: ' + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('valid');
      await CommonFunc.sleep(1000);
      // child none
      let button1 = await driver.findComponent(ON.id("childScrollVisBtn"));
      await button1.click();
      await CommonFunc.sleep(1000);

      let areaObj2 = CommonFunc.getComponentRectOnScreen('FatherControlChildTest1_text');
      let areaHeight2 = areaObj2.bottom - areaObj2.top
      let areaWidth2 = areaObj2.right - areaObj2.left
      console.log('GestureRecognizerIsValid_001 text height and width',areaHeight2, areaWidth2)

      // parent scroll
      await driver.swipe(Math.round(areaObj2.left + areaWidth2 / 2), Math.round(areaObj1.bottom - areaHeight2 * 0.1) , Math.round(areaObj2.left + areaWidth2 / 2), Math.round(areaObj1.top - areaHeight2 * 0.3));

      await CommonFunc.sleep(3000);
      let strJson2 = getInspectorByKey('recognizer_text');
      console.info('[GestureRecognizerIsValid_001] component strJson2 is: ' + JSON.stringify(JSON.parse(strJson2)));
      console.info('[GestureRecognizerIsValid_001] strJson2 content: ' + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('notValid');
      await CommonFunc.sleep(1000);
      console.info('[GestureRecognizerIsValid_001] END');
      done();
    });
  })
}
