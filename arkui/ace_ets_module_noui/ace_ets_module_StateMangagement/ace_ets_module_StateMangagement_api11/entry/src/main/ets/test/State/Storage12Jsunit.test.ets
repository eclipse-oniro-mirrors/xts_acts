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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/utils/Common';


export default function Storage12Jsunit() {
  describe('Storage12Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Storage12Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/Storage12',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Storage12Jsunit state pages: " + JSON.stringify(pages));
        if (!("Storage12" == pages.name)) {
          console.info("get Storage12Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Storage12Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Storage12Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    //Size获取AppStorage中存在键值对的个数
    it('Storage12Jsunit_0100', 0, async (done: Function) => {
      console.info('[Storage12Jsunit_0100] START');
      let driver = await UiDriver.create()
      let Storage12Button1 = await driver.findComponent(BY.key('Storage12Button111'));
      await Storage12Button1.click();
      await CommonFunc.sleep(1000);
      let Storage12ContentJson = getInspectorByKey('Storage12Content');
      let text = JSON.parse(Storage12ContentJson);
      console.info("[Storage12Jsunit_0100] Storage12Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('2');
      console.info('[Storage12Jsunit_0100] END');
      done();
    });

    it('Storage12Jsunit_0200', 0, async (done: Function) => {
      console.info('[Storage12Jsunit_0200] START');
      let driver = await UiDriver.create()
      let Storage12Button2 = await driver.findComponent(BY.key('Storage12Button2'));
      await Storage12Button2.click();
      await CommonFunc.sleep(1000);
      let Storage12ContentJson = getInspectorByKey('Storage12Content');
      let text = JSON.parse(Storage12ContentJson);
      console.info("[Storage12Jsunit_0200] Storage12Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('true');
      console.info('[Storage12Jsunit_0200] END');
      done();
    });

    it('Storage12Jsunit_0300', 0, async (done: Function) => {
      console.info('[Storage12Jsunit_0300] START');
      let Storage12ContentJson = getInspectorByKey('Storage12Text1');
      let text = JSON.parse(Storage12ContentJson);
      console.info("[Storage12Jsunit_0300] Storage12Content is: " + JSON.stringify(text));
      expect(text.$attrs.content).assertEqual('appKeys: storage_,PropA');
      console.info('[Storage12Jsunit_0300] END');
      done();
    });
  })
}
