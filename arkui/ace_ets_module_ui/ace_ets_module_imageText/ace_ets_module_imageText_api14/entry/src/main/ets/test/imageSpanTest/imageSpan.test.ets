/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@system.router';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
const waitUiReadyMs = 1000;
interface optionsObj {
  uri: string
}
export default function imageSpanJsunit() {
  describe('imageSpanJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("imageSpanJsunit beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/imageSpan/imageSpan',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageSpanJsunit state pages: " + JSON.stringify(pages));
        if (!("imageTwo" == pages.name)) {
          console.info("get imageSpanJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push imageSpanJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageSpanJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   imageSpanJsunit_0100
     * @tc.number imageSpanJsunit_0100
     * @tc.desc   imageSpanJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSpanJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('imageSpanJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = getInspectorByKey('imageSpan1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('imageSpanJsunit_0100 component obj is: ' + obj.$attrs.colorFilter);
      expect(obj.$attrs.colorFilter).assertEqual('1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ' +
        '1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 ' +
        '0.000000 1.000000 0.000000 ');
      done();
    });
  })
}