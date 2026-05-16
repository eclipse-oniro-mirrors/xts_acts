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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function MagnifierTest() {
  describe('MagnifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("magnifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MagnifierTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get magnifierTest state pages: " + JSON.stringify(pages));
        if (!("MagnifierTestPage" == pages.name)) {
          console.info("get magnifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push magnifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push magnifierTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MAGNIFIER_BIND_ID_NULL_001
     * @tc.number SUB_ARKUI_MAGNIFIER_BIND_ID_NULL_001
     * @tc.desc   测试 Magnifier bind 属性参数 id为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MAGNIFIER_BIND_ID_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MAGNIFIER_BIND_ID_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_bind_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('magnifier_bind_null')).assertEqual('magnifier bind null succ');
      AppStorage.delete('magnifier_bind_null')
      console.info("SUB_ARKUI_MAGNIFIER_BIND_ID_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MAGNIFIER_BIND_ID_UNDEFINED_001
     * @tc.number SUB_ARKUI_MAGNIFIER_BIND_ID_UNDEFINED_001
     * @tc.desc   测试 Magnifier bind 属性参数 id为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MAGNIFIER_BIND_ID_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MAGNIFIER_BIND_ID_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_bind_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('magnifier_bind_undefined')).assertEqual('magnifier bind undefined succ');
      AppStorage.delete('magnifier_bind_undefined')
      console.info("SUB_ARKUI_MAGNIFIER_BIND_ID_UNDEFINED_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MAGNIFIER_BIND_ID_EMPTY_STRING_001
     * @tc.number SUB_ARKUI_MAGNIFIER_BIND_ID_EMPTY_STRING_001
     * @tc.desc   测试 Magnifier bind 属性参数 id为空字符串的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MAGNIFIER_BIND_ID_EMPTY_STRING_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MAGNIFIER_BIND_ID_EMPTY_STRING_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_bind_empty'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('magnifier_bind_empty')).assertEqual('magnifier bind empty succ');
      AppStorage.delete('magnifier_bind_empty')
      console.info("SUB_ARKUI_MAGNIFIER_BIND_ID_EMPTY_STRING_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MAGNIFIER_SHOW_X_NULL_Y_NULL_001
     * @tc.number SUB_ARKUI_MAGNIFIER_SHOW_X_NULL_Y_NULL_001
     * @tc.desc   测试 Magnifier show 属性参数 x为 null, y为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MAGNIFIER_SHOW_X_NULL_Y_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MAGNIFIER_SHOW_X_NULL_Y_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_show_null_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('magnifier_show_null_null')).assertEqual('magnifier show null null succ');
      AppStorage.delete('magnifier_show_null_null')
      console.info("SUB_ARKUI_MAGNIFIER_SHOW_X_NULL_Y_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MAGNIFIER_SHOW_X_UNDEFINED_Y_UNDEFINED_001
     * @tc.number SUB_ARKUI_MAGNIFIER_SHOW_X_UNDEFINED_Y_UNDEFINED_001
     * @tc.desc   测试 Magnifier show 属性参数 x为 undefined, y为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_MAGNIFIER_SHOW_X_UNDEFINED_Y_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_MAGNIFIER_SHOW_X_UNDEFINED_Y_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_show_undefined_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('magnifier_show_undefined_undefined')).assertEqual('show undefined undefined succ');
      AppStorage.delete('magnifier_show_undefined_undefined')
      console.info("SUB_ARKUI_MAGNIFIER_SHOW_X_UNDEFINED_Y_UNDEFINED_001 end");
      done();
    });
  });
}
