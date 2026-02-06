/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'
 
export default function StyledStringVerticalAlignTest() {
  describe('StyledStringVerticalAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringVerticalAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringVerticalAlignTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringVerticalAlignTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("StyledStringVerticalAlignTest" == pages.name)) {
          console.info("get StyledStringVerticalAlignTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push StyledStringVerticalAlignTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringVerticalAlignTest page error: " + err);
      }
      done();
    });
 
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("StyledStringVerticalAlignTest after each called");
    });
 
    /*
    * @tc.number       SUB_ACE_BASIC_STYLED_STRING_VERTICAL_ALIGN_ETS_API_0001
    * @tc.name         StyledStringVerticalAlignTest0001
    * @tc.desc         test StyledStringVerticalAlign
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('StyledStringVerticalAlignTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      console.info('StyledStringVerticalAlignTest0001 START');
      let getStyles = await driver.findComponent(ON.id('getStyles_textVerticalAlign'))
      await CommonFunc.sleep(500);
      await getStyles.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('textVerticalAlign1')).assertEqual('0');
      expect(''+AppStorage.get('textVerticalAlign2')).assertEqual('1');
      expect(''+AppStorage.get('textVerticalAlign3')).assertEqual('2');
      expect(''+AppStorage.get('textVerticalAlign4')).assertEqual('3');
      expect(''+AppStorage.get('textVerticalAlign5')).assertEqual('undefined');
      expect(''+AppStorage.get('textVerticalAlign6')).assertEqual('0');
      AppStorage.delete('textVerticalAlign1')
      AppStorage.delete('textVerticalAlign2')
      AppStorage.delete('textVerticalAlign3')
      AppStorage.delete('textVerticalAlign4')
      AppStorage.delete('textVerticalAlign5')
      AppStorage.delete('textVerticalAlign6')
      console.info("[StyledStringVerticalAlignTest0001] end");
      done();
    });
  })
}