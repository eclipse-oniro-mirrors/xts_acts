/*
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from "../../MainAbility/common/Common";

export default function ScrollTest2() {
  describe('ScrollTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/Index2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index2" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done()
    });

    /*
     *@tc.number ArkUX_Scroll_Visual_0010
     *@tc.name   Support modifying the scroll scrollPage hange of Scroll component
     *@tc.desc   Sets the scrollPage property parameter to true or false
     */
    it('ArkUX_Scroll_Visual_0010', 0, async (done: Function) => {
      console.info('ArkUX_Scroll_Visual_0010 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Scroll_Visual_0010');
          console.info('ArkUX_Scroll_Visual_0010 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Scroll_Visual_0010 obj is: " + JSON.stringify(obj));
          let scrollable: string = obj.$attrs.scrollable
          expect(scrollable).assertEqual("ScrollDirection.Vertical");
          console.info('ArkUX_Scroll_Visual_0010 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Scroll_Visual_0010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}