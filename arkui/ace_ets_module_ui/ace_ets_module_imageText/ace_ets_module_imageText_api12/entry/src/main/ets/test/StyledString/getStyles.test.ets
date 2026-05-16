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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function getStyles() {
  describe('getStyles', () => {
    beforeEach(async (done: Function) => {
      console.info("getStyles beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/getStyles',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getStyles state pages:" + JSON.stringify(pages));
        if (!("getStyles" == pages.name)) {
          console.info("get getStyles pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getStyles page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getStyles page error:" + err);
      }
      console.info("getStyles beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   getStyles_0100
     * @tc.number getStyles_0100
     * @tc.desc   getStyles_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStyles_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('getStyles_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('getStyles'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('getStyles_0100 END');
      done();
    });

    /**
     * @tc.name   getStyles_0200
     * @tc.number getStyles_0200
     * @tc.desc   getStyles_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStyles_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('getStyles_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('subStyledString'));
      await CommonFunc.sleep(500);
      await but.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
        JSON.stringify(obj.$attrs.content));
      expect('' + obj.$attrs.content).assertEqual("401");

      console.info('getStyles_0200 END');
      done();
    });

  })
}