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

export default function RouterPushUrlReplaceUrlNullUndefinedTest() {
  describe('RouterPushUrlReplaceUrlNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RouterPushUrlReplaceUrlNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/RouterPushUrlReplaceUrlNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RouterPushUrlReplaceUrlNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("RouterPushUrlReplaceUrlNullUndefined" == pages.name)) {
          console.info("get RouterPushUrlReplaceUrlNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RouterPushUrlReplaceUrlNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RouterPushUrlReplaceUrlNullUndefinedTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ROUTER_PUSHURL_PARAM_NULL_001
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_PARAM_NULL_001
     * @tc.desc   测试 Router pushUrl 方法，options 参数为 null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_PUSHURL_PARAM_NULL_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_ROUTER_PUSHURL_PARAM_NULL_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RouterPushUrlNullUndefined_Button_PushUrlNull'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('pushUrl_Null')).assertContain('Parameter error');
      AppStorage.delete('pushUrl_Null')
      console.log('SUB_ARKUI_ROUTER_PUSHURL_PARAM_NULL_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_ROUTER_PUSHURL_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_PARAM_UNDEFINED_001
     * @tc.desc   测试 Router pushUrl 方法，options 参数为 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_PUSHURL_PARAM_UNDEFINED_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_ROUTER_PUSHURL_PARAM_UNDEFINED_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RouterPushUrlNullUndefined_Button_PushUrlUndefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('pushUrl_undefined')).assertContain('Parameter error');
      AppStorage.delete('pushUrl_undefined')
      console.log('SUB_ARKUI_ROUTER_PUSHURL_PARAM_UNDEFINED_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_ROUTER_PUSHURL_PARAM_EMPTY_001
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_PARAM_EMPTY_001
     * @tc.desc   测试 Router pushUrl 方法，options 参数为 空字符串''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_PUSHURL_PARAM_EMPTY_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_ROUTER_PUSHURL_PARAM_EMPTY_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RouterPushUrlNullUndefined_Button_PushUrlEmpty'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('pushUrl_empty')).assertContain('Parameter error');
      AppStorage.delete('pushUrl_empty')
      console.log('SUB_ARKUI_ROUTER_PUSHURL_PARAM_EMPTY_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_ROUTER_REPLACEURL_PARAM_NULL_001
     * @tc.number SUB_ARKUI_ROUTER_REPLACEURL_PARAM_NULL_001
     * @tc.desc   测试 Router replaceUrl 方法 options 参数为 null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_NULL_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_NULL_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RouterPushUrlNullUndefined_Button_ReplaceUrlNull'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('replaceUrl_null')).assertContain('Parameter error');
      AppStorage.delete('replaceUrl_null')
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_NULL_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_ROUTER_REPLACEURL_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_ROUTER_REPLACEURL_PARAM_UNDEFINED_001
     * @tc.desc   测试 Router replaceUrl 方法，options 参数为 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_UNDEFINED_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_UNDEFINED_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RouterPushUrlNullUndefined_Button_ReplaceUrlUndefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('replaceUrl_undefined')).assertContain('Parameter error');
      AppStorage.delete('replaceUrl_undefined')
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_UNDEFINED_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_ROUTER_REPLACEURL_PARAM_EMPTY_001
     * @tc.number SUB_ARKUI_ROUTER_REPLACEURL_PARAM_EMPTY_001
     * @tc.desc   测试 Router replaceUrl 方法，options 参数为 空字符串''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_EMPTY_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_EMPTY_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RouterPushUrlNullUndefined_Button_ReplaceUrlEmpty'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('replaceUrl_empty')).assertContain('Parameter error');
      AppStorage.delete('replaceUrl_empty')
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_PARAM_EMPTY_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_ROUTER_REPLACEURL_RECOVERABLE_TRUE_001
     * @tc.number SUB_ARKUI_ROUTER_REPLACEURL_RECOVERABLE_TRUE_001
     * @tc.desc   测试 Router replaceUrl 方法，recoverable 设置为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_REPLACEURL_RECOVERABLE_TRUE_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_RECOVERABLE_TRUE_001 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('RouterPushUrlNullUndefined_Button_recoverableTrue'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('replaceUrl_recoverable_true')).assertContain('Parameter error');
      AppStorage.delete('replaceUrl_recoverable_true')
      console.log('SUB_ARKUI_ROUTER_REPLACEURL_RECOVERABLE_TRUE_001 END')
    })

    /**
     * @tc.name   SUB_ARKUI_NAROUTER_NavRouteMode_REPLACE_001
     * @tc.number SUB_ARKUI_NAROUTER_NavRouteMode_REPLACE_001
     * @tc.desc   测试 nav_router NavRouteMode.REPLACE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NAROUTER_NavRouteMode_REPLACE_001', Level.LEVEL2, async () => {
      console.log('SUB_ARKUI_NAROUTER_NavRouteMode_REPLACE_001 START')
      expect(NavRouteMode.REPLACE).assertEqual(2);
      console.log('SUB_ARKUI_NAROUTER_NavRouteMode_REPLACE_001 END')
    })
  })
}
