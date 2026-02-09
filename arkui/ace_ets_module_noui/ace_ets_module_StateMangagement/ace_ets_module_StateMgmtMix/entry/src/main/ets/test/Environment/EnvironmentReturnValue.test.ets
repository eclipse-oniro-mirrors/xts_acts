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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function EnvironmentReturnValue() {
  describe('EnvironmentReturnValue', () => {
    beforeEach(async (done: Function) => {
      console.info("EnvironmentReturnValue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Environment/EnvironmentReturnValue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnvironmentReturnValue state pages:" + JSON.stringify(pages));
        if (!("EnvironmentReturnValue" == pages.name)) {
          console.info("get EnvironmentReturnValue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push EnvironmentReturnValue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnvironmentReturnValue page error:" + err);
      }
      console.info("EnvironmentReturnValue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("EnvironmentReturnValue after each called");
    });

    /**
     * @tc.name   EnvironmentReturnValue_001
     * @tc.number EnvironmentReturnValue_001
     * @tc.desc   all keys in Environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnvironmentReturnValue_001', Level.LEVEL0, async (done: Function) => {
      console.info('[EnvironmentReturnValue_001] START');
      await CommonFunc.sleep(1000);
      let keys_1: Array<string> = Environment.keys();
      let keys_2: Array<string> = Environment.Keys();
      console.info("[EnvironmentReturnValue_001] component keys_1: " + JSON.stringify(keys_1));
      console.info("[EnvironmentReturnValue_001] component keys_2 is: " + JSON.stringify(keys_2));
      expect(keys_1.length).assertEqual(0);
      expect(keys_2.length).assertEqual(0);
      let res_0011: boolean = Environment.envProp<string>('EnvironmentReturnValue_001', 'cc');
      let res_0012: boolean = Environment.envProp<string>('EnvironmentReturnValue_001', 'cc');
      console.info("[EnvironmentReturnValue_001] component res_0011: " + JSON.stringify(res_0011));
      console.info("[EnvironmentReturnValue_001] component res_0012 is: " + JSON.stringify(res_0012));
      expect(res_0011).assertTrue();
      expect(res_0012).assertFalse();
      let keys_3: Array<string> = Environment.keys();
      let keys_4: Array<string> = Environment.Keys();
      console.info("[EnvironmentReturnValue_001] component keys_3: " + JSON.stringify(keys_3));
      console.info("[EnvironmentReturnValue_001] component keys_4: " + JSON.stringify(keys_4));
      expect(keys_3.length > 0).assertTrue();
      expect(keys_4.length > 0).assertTrue();
      AppStorage.delete('EnvironmentReturnValue_001');
      console.info('[EnvironmentReturnValue_001] END');
      done();
    });

    /**
     * @tc.name   EnvironmentReturnValue_002
     * @tc.number EnvironmentReturnValue_002
     * @tc.desc   all keys in Environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnvironmentReturnValue_002', Level.LEVEL0, async (done: Function) => {
      console.info('[EnvironmentReturnValue_002] START');
      await CommonFunc.sleep(1000);
      let res_0021: boolean = Environment.EnvProp<string>('EnvironmentReturnValue_002', 'cc');
      let res_0022: boolean = Environment.EnvProp<string>('EnvironmentReturnValue_002', 'cc');
      console.info("[EnvironmentReturnValue_002] component res1 res_0021: " + JSON.stringify(res_0021));
      console.info("[EnvironmentReturnValue_002] component res_0022 is: " + JSON.stringify(res_0022));
      expect(res_0021).assertTrue();
      expect(res_0022).assertFalse();
      AppStorage.delete('EnvironmentReturnValue_002');
      console.info('[EnvironmentReturnValue_002] END');
      done();
    });

  })
}
