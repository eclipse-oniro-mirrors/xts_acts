/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function lineNeJsunit() {
  describe('lineTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push line page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testLineNe00071
     * @tc.number testLineNe00071
     * @tc.desc   Set startPoint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLineNe00071', Level.LEVEL0, async (done: Function) => {
      console.info('lineNe testLineNe00071 START');
      let strJson = getInspectorByKey('LineKey1');
      console.info("[testLineNe00071] obj value :" + JSON.parse(strJson).$attrs);
      expect(JSON.parse(strJson).$attrs.startPoint[0]).assertEqual(0);
      console.info('lineNe testLineNe00071 END');
      done();
    });

    /**
     * @tc.name   testLineNe00072
     * @tc.number testLineNe00072
     * @tc.desc   Set endPoint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLineNe00072', Level.LEVEL0, async (done: Function) => {
      console.info('lineNe testLineNe00072 START');
      let strJson = getInspectorByKey('LineKey1');
      console.info("[testLineNe00072] obj value :" + JSON.parse(strJson).$attrs);
      expect(JSON.parse(strJson).$attrs.endPoint[0]).assertEqual(200);
      console.info('lineNe testLineNe00072 END');
      done();
    });

    /**
     * @tc.name   testLineNe00073
     * @tc.number testLineNe00073
     * @tc.desc   Change startPoint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLineNe00073', Level.LEVEL0, async (done: Function) => {
      console.info('testLineNe00073 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('LineKey1'); //测试组件的key名称
      console.info("testLineNe00073 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.startPoint[0]).assertEqual(1); //
      console.info('testLineNe00073 END');
      done();
    });
  })
}
