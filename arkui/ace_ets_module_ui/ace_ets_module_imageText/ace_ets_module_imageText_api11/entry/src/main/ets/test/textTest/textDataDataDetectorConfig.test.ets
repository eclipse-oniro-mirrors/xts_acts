/**
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from "../../MainAbility/common/Common";
import { Driver, ON } from '@ohos.UiTest';

export default function textDataDataDetectorConfig() {
  describe('textDataDataDetectorConfig', () => {
    beforeEach(async (done: Function) => {
      console.info("textDataDataDetectorConfig beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/textDataDataDetectorConfig',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textDataDataDetectorConfig state pages:" + JSON.stringify(pages));
        if (!("textDataDataDetectorConfig" == pages.name)) {
          console.info("get textDataDataDetectorConfig pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push textDataDataDetectorConfig page result:" + JSON.stringify(result));
        }
      } catch (err) {

        console.error("push textDataDataDetectorConfig page error:" + err);
      }
      console.info("textDataDataDetectorConfig beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textDataDataDetectorConfig after each called");
    });

    /**
     * @tc.number    textDataDataDetectorConfig_0001
     * @tc.name      textDataDataDetectorConfig_0001
     * @tc.desc      text api
     * @tc.level       Level 1
     * @tc.type
    * @tc.size
     */
    it('textDataDataDetectorConfig_0001', Level.LEVEL1, async (done: Function) => {
      console.info('[textDataDataDetectorConfig_0001] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.PHONE_NUMBER'));
      await btn.click()
      await CommonFunc.sleep(4000);
      let text1 = getInspectorByKey('dataDetectorConfigText');
      let Obj2: ESObject = JSON.parse(text1);
      expect(Obj2.$attrs.content).assertEqual('222');

      console.info('[textDataDataDetectorConfig_0001] END');
      done();
    });

    /**
     * @tc.number    textDataDataDetectorConfig_0002
     * @tc.name      textDataDataDetectorConfig_0002
     * @tc.desc      text api
     * @tc.level       Level 1
     * @tc.type
    * @tc.size
     */
    it('textDataDataDetectorConfig_0002', Level.LEVEL1, async (done: Function) => {
      console.info('[textDataDataDetectorConfig_0002] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.URL'));
      await btn.click()
      await CommonFunc.sleep(4000);
      let text1 = getInspectorByKey('dataDetectorConfigText');
      let Obj2: ESObject = JSON.parse(text1);
      expect(Obj2.$attrs.content).assertEqual('222');
      console.info('[textDataDataDetectorConfig_0002] END');
      done();
    });


    /**
     * @tc.number    textDataDataDetectorConfig_0003
     * @tc.name      textDataDataDetectorConfig_0003
     * @tc.desc      text api
     * @tc.level       Level 1
     * @tc.type
    * @tc.size
     */
    it('textDataDataDetectorConfig_0003', Level.LEVEL1, async (done: Function) => {
      console.info('[textDataDataDetectorConfig_0003] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.EMAIL'));
      await btn.click()
      await CommonFunc.sleep(4000);
      let text1 = getInspectorByKey('dataDetectorConfigText');
      let Obj2: ESObject = JSON.parse(text1);
      expect(Obj2.$attrs.content).assertEqual('222');

      console.info('[textDataDataDetectorConfig_0003] END');
      done();
    });


    /**
     * @tc.number    textDataDataDetectorConfig_0004
     * @tc.name      textDataDataDetectorConfig_0004
     * @tc.desc      text api
     * @tc.level       Level 1
     * @tc.type
    * @tc.size
     */
    it('textDataDataDetectorConfig_0004', Level.LEVEL1, async (done: Function) => {
      console.info('[textDataDataDetectorConfig_0004] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('button.ADDRESS'));
      await btn.click()
      await CommonFunc.sleep(4000);
      let text1 = getInspectorByKey('dataDetectorConfigText');
      let Obj2: ESObject = JSON.parse(text1);
      expect(Obj2.$attrs.content).assertEqual('222');
      console.info('[textDataDataDetectorConfig_0004] END');
      done();
    });
  })
}
