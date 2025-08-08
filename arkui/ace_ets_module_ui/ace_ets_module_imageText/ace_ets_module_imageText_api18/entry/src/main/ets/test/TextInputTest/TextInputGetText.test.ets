/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function TextInputGetTextTest() {
  describe('TextInputGetTextTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputGetTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputGetText',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputGetTextTest state pages: " + JSON.stringify(pages));
        if (!("TextInputGetText" == pages.name)) {
          console.info("get TextInputGetTextTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputGetTextTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputGetTextTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0080
     * @tc.name      TextInputGetTextTest_0080
     * @tc.desc      test TextInput: clearPreviewText
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_0080', Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputGetTextTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_clearPreViewText'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0080] TextInput:" + JSON.stringify(AppStorage.get('clearPreViewText_TextInput')));
      expect(AppStorage.get('clearPreViewText_TextInput')).assertEqual('succ');
      AppStorage.delete('clearPreViewText_TextInput')
      console.info('[TextInputGetTextTest_0080] END');
      done();
    });
  })
}
