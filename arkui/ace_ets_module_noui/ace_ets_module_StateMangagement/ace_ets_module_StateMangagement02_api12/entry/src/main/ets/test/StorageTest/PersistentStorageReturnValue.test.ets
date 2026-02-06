/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function PersistentStorageReturnValue() {
  describe('PersistentStorageReturnValue', () => {
    beforeEach(async (done: Function) => {
      console.info("PersistentStorageReturnValue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Storage/PersistentStorageReturnValue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PersistentStorageReturnValue state pages:" + JSON.stringify(pages));
        if (!("PersistentStorageReturnValue" == pages.name)) {
          console.info("get PersistentStorageReturnValue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistentStorageReturnValue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistentStorageReturnValue page error:" + err);
      }
      console.info("PersistentStorageReturnValue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PersistentStorageReturnValue after each called");
    });


    /**
     * @tc.name   PersistentStorageReturnValue_002
     * @tc.number PersistentStorageReturnValue_002
     * @tc.desc   all keys in PersistentStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PersistentStorageReturnValue_002', Level.LEVEL0, async (done: Function) => {
      console.info('[PersistentStorageReturnValue_002] START');
      await CommonFunc.sleep(1000);
      let res_0021: Array<string> = PersistentStorage.keys();
      PersistentStorage.persistProp('PersistentStorageReturnValue_002', 47);
      let res_0022: Array<string> = PersistentStorage.keys();
      console.info("[PersistentStorageReturnValue_002] component res_0021: " + JSON.stringify(res_0021));
      console.info("[PersistentStorageReturnValue_002] component res_0022: " + JSON.stringify(res_0022));
      expect(res_0021.length).assertEqual(0);
      expect(res_0022.length > 0).assertTrue();
      console.info("[PersistentStorageReturnValue_002] component PersistentStorage.deleteProp: " + JSON.stringify(PersistentStorage.deleteProp('PersistentStorageReturnValue_002')));
      console.info("[PersistentStorageReturnValue_002] component AppStorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[PersistentStorageReturnValue_002] END');
      done();
    });

    /**
     * @tc.name   PersistentStorageReturnValue_003
     * @tc.number PersistentStorageReturnValue_003
     * @tc.desc   all keys in PersistentStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PersistentStorageReturnValue_003', Level.LEVEL0, async (done: Function) => {
      console.info('[PersistentStorageReturnValue_003] START');
      await CommonFunc.sleep(1000);
      let res_0031: Array<string> = PersistentStorage.Keys();
      PersistentStorage.persistProp('PersistentStorageReturnValue_003', 47);
      let res_0032: Array<string> = PersistentStorage.Keys();
      console.info("[PersistentStorageReturnValue_003] component res_0031: " + JSON.stringify(res_0031));
      console.info("[PersistentStorageReturnValue_003] component res_0032: " + JSON.stringify(res_0032));
      expect(res_0031.length).assertEqual(0);
      expect(res_0032.length > 0).assertTrue();
      console.info("[PersistentStorageReturnValue_003] component PersistentStorage.deleteProp: " + JSON.stringify(PersistentStorage.deleteProp('PersistentStorageReturnValue_003')));
      console.info("[PersistentStorageReturnValue_003] component AppStorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[PersistentStorageReturnValue_003] END');
      done();
    });

  })
}
