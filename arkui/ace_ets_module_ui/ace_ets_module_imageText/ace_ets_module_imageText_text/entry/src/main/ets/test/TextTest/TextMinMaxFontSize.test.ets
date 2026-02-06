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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextMinMaxFontSize() {
  describe('TextMinMaxFontSize', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMinMaxFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMinMaxFontSize state success " + JSON.stringify(pages));
        if (!("TextminMaxFontSize" == pages.name)) {
          console.info("get TextMinMaxFontSize state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMinMaxFontSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMinMaxFontSize page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextMinMaxFontSize after each called");
    });

    /**
     * @tc.name   minMaxFontSize0001
     * @tc.number minMaxFontSize0001
     * @tc.desc   Set the minFontSize and maxFontSize properties of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('minMaxFontSize0001', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('minMaxFontSize minMaxFontSize0001 START');
        await CommonFunc.sleep(500);

        let strJson = getInspectorByKey('text1MinMaxFontSize');
        let obj: ESObject = JSON.parse(strJson);
        console.log('minMaxFontSize0001---obj.$attrs.minFontSize---' +
         JSON.stringify(obj.$attrs.minFontSize));
        console.log('minMaxFontSize0001---obj.$attrs.maxFontSize---' +
         JSON.stringify(obj.$attrs.maxFontSize));
        expect('' + obj.$attrs.minFontSize).assertEqual("10.00fp");
        expect('' + obj.$attrs.maxFontSize).assertEqual("30.00fp");

        //10.00fp    30.00fp
        let strJson2 = getInspectorByKey('text2MinMaxFontSize');
        let obj2: ESObject = JSON.parse(strJson2);
        console.log('minMaxFontSize0001---obj2.$attrs.minFontSize---' +
         JSON.stringify(obj2.$attrs.minFontSize));
        console.log('minMaxFontSize0001---obj2.$attrs.maxFontSize---' +
         JSON.stringify(obj2.$attrs.maxFontSize));
        expect('' + obj2.$attrs.minFontSize).assertEqual("10.00fp");
        expect('' + obj2.$attrs.maxFontSize).assertEqual("30.00fp");
        //0.00fp    0.00fp
        let strJson3 = getInspectorByKey('text3MinMaxFontSize');
        let obj3: ESObject = JSON.parse(strJson3);
        console.log('minMaxFontSize0001---obj3.$attrs.minFontSize---' +
         JSON.stringify(obj3.$attrs.minFontSize));
        console.log('minMaxFontSize0001---obj3.$attrs.maxFontSize---' +
         JSON.stringify(obj3.$attrs.maxFontSize));
        expect('' + obj3.$attrs.minFontSize).assertContain("0.00");
        expect('' + obj3.$attrs.maxFontSize).assertContain("0.00");
        //0.00fp    0.00fp
        console.info("[minMaxFontSize0001] end");
    });
  })
}
