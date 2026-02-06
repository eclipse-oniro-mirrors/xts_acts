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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function StorageDeprecatedTest() {
  describe('StorageDeprecatedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageDeprecatedTest setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Environment/StorageDeprecated",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("StorageDeprecated" == pages.name)) {
          console.info("get StorageDeprecatedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageDeprecatedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageDeprecatedTest page error:" + err);
      }
      console.info("StorageDeprecatedTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StorageDeprecatedTest after each called");
    });

    /**
     * @tc.name   StorageDeprecatedTest_001
     * @tc.number StorageDeprecatedTest_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageDeprecatedTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[StorageDeprecatedTest_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvDeprecatedGet'));
      console.info("[StorageDeprecatedTest] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('HelloArkUI');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnDelASKey"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvDeprecatedDel'));
      console.info("[StorageDeprecatedTest] component obj1 content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('true');
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvDeprecatedDel1'));
      console.info("[StorageDeprecatedTest] component obj2 content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('false');
      console.info('[StorageDeprecatedTest_001] END');
      done();
    });

    /**
     * @tc.name   StorageDeprecatedTest_002
     * @tc.number StorageDeprecatedTest_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageDeprecatedTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[StorageDeprecatedTest_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let textZh = await driver.findComponent(ON.text('你好Environment'))
      let textEn = await driver.findComponent(ON.text('HelloEnvironment'))
      expect((textZh || textEn) != null).assertTrue()
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvADPersistPropsA'));
      console.info("[StorageDeprecatedTest] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('HelloPersistPropsA');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvADPersistPropsAb'));
      console.info("[StorageDeprecatedTest] component obj2 content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('HelloPersistPropsAb');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvADPersistentStorageA'));
      console.info("[StorageDeprecatedTest] component obj1 content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('HelloPersistPropA');
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnDelPSKey"));
      await CommonFunc.sleep(1000);
      await btn.click();
      console.info('[StorageDeprecatedTest_002] END');
      done();
    });

    /**
     * @tc.name   StorageDeprecatedTest_003
     * @tc.number StorageDeprecatedTest_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageDeprecatedTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[StorageDeprecatedTest_003] START');
      await CommonFunc.sleep(2000);
      let para: Record<string, number> = { 'StorageDeprecatedTest_003': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let res_0031: boolean = storage.setOrCreate('StorageDeprecatedTest_003', 48);
      let res_0032: boolean = storage.setOrCreate('StorageDeprecatedTest_003_no', null);
      console.info("[StorageDeprecatedTest_003] component res_0031: " + JSON.stringify(res_0031));
      console.info("[StorageDeprecatedTest_003] component res_0032: " + JSON.stringify(res_0032));
      expect(res_0031).assertTrue();
      storage.delete('StorageDeprecatedTest_003');
      storage.delete('StorageDeprecatedTest_003_no');
      console.info('[StorageDeprecatedTest_003] END');
      done();
    });


  })
}
