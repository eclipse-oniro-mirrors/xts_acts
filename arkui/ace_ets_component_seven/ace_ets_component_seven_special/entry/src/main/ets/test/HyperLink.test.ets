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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import Utils from './Utils';

export default function hyperLinkJsunit() {
  describe('hyperLinkJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("hyperLinkJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/hyperlink',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get hyperLink state pages: " + JSON.stringify(pages));
        if (!("checkBox" == pages.name)) {
          console.info("get hyperLink state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push hyperLink page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push hyperLink page error: " + err);
      }
      done();
    })

    /**
     * @tc.number ArkUX_Stage_hyperLink_attrs_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_hyperLink_attrs_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_hyperLink_attrs_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('HyperlinkKey1');
          console.info('ArkUX_Stage_hyperLink_attrs_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_hyperLink_attrs_0100 component obj is: " + JSON.stringify(obj));
          expect(obj.$attrs.color).assertEqual("#FF789456");
          console.info('ArkUX_Stage_hyperLink_attrs_0100 END ');
        } catch (err) {
          console.info('ArkUX_Stage_hyperLink_attrs_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}
