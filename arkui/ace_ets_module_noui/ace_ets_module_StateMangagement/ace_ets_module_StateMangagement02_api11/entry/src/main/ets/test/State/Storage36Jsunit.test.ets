/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function Storage36Jsunit() {
  describe('Storage36Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Storage36Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/Storage36',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Storage36Jsunit state pages: " + JSON.stringify(pages));
        if (!("Storage36" == pages.name)) {
          console.info("get Storage36Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Storage36Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Storage36Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back({
        url: "MainAbility/pages/index/index"
      });
    });

    it('Storage36Jsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('Storage36Jsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Storage36Btn'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text36_link1Date');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Storage36Jsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[Storage36Jsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("160");
      console.info('[Storage36Jsunit_0300] END');
      done();
    });

    it('Storage36Jsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('Storage36Jsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Storage36Btn'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text36_link1Date2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Storage36Jsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[Storage36Jsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("48");
      console.info('[Storage36Jsunit_0400] END');
      done();
    });
  })
}
