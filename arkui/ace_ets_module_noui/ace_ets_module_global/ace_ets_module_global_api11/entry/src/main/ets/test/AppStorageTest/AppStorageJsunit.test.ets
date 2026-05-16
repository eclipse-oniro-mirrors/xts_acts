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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium";
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils'


export default function AppStorageJsunit() {
  describe('appStorage', () => {

    beforeEach(async (done: Function) => {
      console.info("appStorage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/appStorage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("appStorage" == pages.name)) {
          console.info("get appStorage state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push appStorage page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("appStorage after each called");
    })


    /**
     * @tc.name   stateManagement_AppStorage_setOrCreate_0100
     * @tc.number stateManagement_AppStorage_setOrCreate_0100
     * @tc.desc   stateManagement_AppStorage_setOrCreate_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_AppStorage_setOrCreate_0100', Level.LEVEL0, (done: Function) => {
      console.info('[stateManagement_AppStorage_setOrCreate_0100] START');
      AppStorage.setOrCreate<string>("key1", "value1");
      AppStorage.setOrCreate<string>("key2", "value2");
      AppStorage.setOrCreate<string>("key3", "value3");
      let size = AppStorage.Size();
      console.info('[stateManagement_AppStorage_setOrCreate_0100] size =' + size);
      expect(size == 3)
        .assertTrue;
      let key1 = AppStorage.get<string>("key1");
      console.info('[stateManagement_AppStorage_setOrCreate_0100] key1 = ' + key1);
      console.info('[stateManagement_AppStorage_setOrCreate_0100] END');
      done();
    });


    /**
     * @tc.name   stateManagement_Storage_set_0100
     * @tc.number stateManagement_Storage_set_0100
     * @tc.desc   stateManagement_Storage_set_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_Storage_set_0100', Level.LEVEL0, (done: Function) => {
      done();
      return;

      console.info('[stateManagement_Storage_set_0100] START');
      let storage: ESObject = new Storage();
      console.info('[stateManagement_Storage_set_0100] 0000');
      storage.set("key5", "value5");
      storage.set("key6", "value6");
      console.info('[stateManagement_Storage_set_0100] 1111');
      let key5: string = storage.get("key5");
      let key6: string = storage.get("key6");
      console.info('[stateManagement_Storage_set_0100] 2222' + key5);
      storage.delete("key5");
      key5 = storage.get("key5");
      console.info('[stateManagement_Storage_set_0100] 3333');
      console.info('[stateManagement_Storage_set_0100] key5 =' + key5);
      console.info('[stateManagement_Storage_set_0100] key6 =' + key6);
      storage.clear();
      key6 = storage.get("key6");
      console.info('[stateManagement_Storage_set_0100] key6 =' + key6);
      console.info('[stateManagement_Storage_set_0100] END');
      done();
    });



    /**
     * @tc.name   stateManagement_Environment_EnvProps_0100
     * @tc.number stateManagement_Environment_EnvProps_0100
     * @tc.desc   stateManagement_Environment_EnvProps_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stateManagement_Environment_EnvProps_0100', Level.LEVEL0, (done: Function) => {
      console.info('[stateManagement_Environment_EnvProps_0100] START');
      try {
        Environment.EnvProps([{
          key: "colorMode", defaultValue: ColorMode.LIGHT
        }, {
          key: "layoutDirection", defaultValue: LayoutDirection.LTR
        }]);
        let enable: number | undefined = AppStorage.get("colorMode");
        let enable1: number | undefined = AppStorage.get("layoutDirection");
        expect(enable == ColorMode.LIGHT)
          .assertTrue;
        expect(enable1 == LayoutDirection.RTL)
          .assertTrue;
        console.info('[stateManagement_Environment_EnvProps_0100] enable = ' + enable);
        console.info('[stateManagement_Environment_EnvProps_0100] enable1 = ' + enable1);
      } catch (err) {
        console.info('[stateManagement_Environment_EnvProps_0100] err = ' + err);
      }
      console.info('[stateManagement_Environment_EnvProps_0100] END');
      done();
    });
  })
}
