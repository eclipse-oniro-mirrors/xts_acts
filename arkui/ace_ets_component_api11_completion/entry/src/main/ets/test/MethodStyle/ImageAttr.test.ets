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
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import CommonFunc from "../../MainAbility/common/Common";

import { Driver, ON } from '@ohos.UiTest';

export default function ImageAttr() {
  describe('ImageAttr', function () {
    beforeEach(async function (done) {
      console.info("ImageAttr beforeEach start");
      let options = {
        uri: 'MainAbility/pages/MethodStyle/ImageAttr',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageAttr state success " + JSON.stringify(pages));
        if (!("ImageAttr" == pages.name)) {
          console.info("get ImageAttr state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageAttr page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageAttr page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("ImageAttr after each called");
    });

    /**
     * @tc.number      ImageAttr_001
     * @tc.name        ImageAttr_001
     * @tc.desc        Image test
     * @tc.level       Level 2
     */
    it('ImageAttr_001', 0, async function (done) {
      console.info('[ImageAttr_001] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create()

      let button = await driver.findComponent(ON.id('changeTop'));
      await button.click();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('changeBottom'));
      await button1.click();
      await CommonFunc.sleep(1000);


      let strJson1 = getInspectorByKey('top_test');
      await CommonFunc.sleep(200);
      let obj1 = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('30');


      let strJson2 = getInspectorByKey('bottom_test');
      await CommonFunc.sleep(200);
      let obj2 = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('0');


      console.info('[ImageAttr_001] END');
      done();
    });





    /**
     * @tc.number      ImageAttr_002
     * @tc.name        ImageAttr_002
     * @tc.desc        Image test
     * @tc.level       Level 2
     */
    it('ImageAttr_002', 0, async function (done) {
      console.info('[ImageAttr_002] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()

      let button2 = await driver.findComponent(ON.id('changeleft'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let button3 = await driver.findComponent(ON.id('changeright'));
      await button3.click();
      await CommonFunc.sleep(1000);


      let strJson3 = getInspectorByKey('left_test');
      await CommonFunc.sleep(200);
      let obj3 = JSON.parse(strJson3);
      await CommonFunc.sleep(1000);
      expect(obj3.$attrs.content).assertEqual('30');



      let strJson4 = getInspectorByKey('right_test');
      await CommonFunc.sleep(200);
      let obj4 = JSON.parse(strJson4);
      await CommonFunc.sleep(1000);
      expect(obj4.$attrs.content).assertEqual('0');

      console.info('[ImageAttr_002] END');
      done();
    });





  })
}


