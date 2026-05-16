/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, Level, it, expect } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SystemRouterReplaceNullUndefinedTest() {
  describe('SystemRouterReplaceNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SystemRouterReplaceNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/systemRouter/SystemRouterReplaceNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SystemRouterReplaceNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("SystemRouterReplaceNullUndefined" == pages.name)) {
          console.info("get SystemRouterReplaceNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SystemRouterReplaceNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SystemRouterReplaceNullUndefinedTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_NULL_001
     * @tc.number SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_NULL_001
     * @tc.desc   测试 Router replace 方法 options 参数为 null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_NULL_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_NULL_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('SystemRouterReplaceNullUndefined_Button_ReplaceNull'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('replace_Null')).assertEqual('replace null success');
      AppStorage.delete('replace_Null')
      console.log('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_NULL_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_UNDEFINED_001
     * @tc.desc   测试 Router replace 方法 options 参数为 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_UNDEFINED_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_UNDEFINED_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('SystemRouterReplaceNullUndefined_Button_ReplaceUndefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('replace_undefined')).assertEqual('replace undefined success');
      AppStorage.delete('replace_undefined')
      console.log('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_UNDEFINED_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_EMPTY_001
     * @tc.number SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_EMPTY_001
     * @tc.desc   测试 Router replace 方法 options 参数为 空字符串''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_EMPTY_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_EMPTY_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('SystemRouterReplaceNullUndefined_Button_ReplaceEmpty'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('replace_empty')).assertEqual('replace empty uri success');
      AppStorage.delete('replace_empty')
      console.log('SUB_ARKUI_SYSTEMROUTER_REPLACE_PARAM_EMPTY_001 END')
    })
  })
}
