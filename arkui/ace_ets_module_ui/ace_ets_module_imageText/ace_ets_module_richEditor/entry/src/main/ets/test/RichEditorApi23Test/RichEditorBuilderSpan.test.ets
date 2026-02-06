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
import { Driver, ON} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function RichEditorBuildSpanTest() {
  describe('RichEditorBuildSpanTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorBuildSpanTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi23/RichEditorBuilderSpan',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorBuildSpanTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorBuildSpan" == pages.name)) {
          console.info("get RichEditorBuildSpanTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorBuildSpanTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorBuildSpanTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorBuildSpanTest_0010
     * @tc.number SUB_ACE_RichEditorBuildSpanTest_0010
     * @tc.desc   test the addBuilderSpan of RichEditor: 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorBuildSpanTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorBuildSpanTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let richEditor1 = await driver.findComponent(ON.id('RichEditor_addBuilderSpan'));
      await richEditor1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('RichEditor_addBuilderSpan')).assertEqual("1");
      AppStorage.delete('RichEditor_addBuilderSpan');
      console.info('[RichEditorBuildSpanTest_0010] END');
      done();
    });
  })
}