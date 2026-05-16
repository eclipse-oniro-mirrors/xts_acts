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
 import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function scrollbarTest() {
  describe('scrollbarTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scrollbarTest/scrollbarTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get scrollbarTest state pages: ' + JSON.stringify(pages));
        if (!('scrollbarTest' == pages.name)) {
          console.info('get scrollbarTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push scrollbarTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push scrollbarTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('scrollbarTest after each called');
    });
    /**
     * @tc.name   scrollbarTest_0010
     * @tc.number scrollbarTest_0010
     * @tc.desc   scrollbarColor test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollbarTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('scrollbarTest_0010 START');
      let driver = await Driver.create();

      let text = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[scrollbarTest_0010] scrollbarColor: ' + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertEqual('#FFFFA500');
      console.info('[scrollbarTest_0010] END');
      done();
    });
  })
}