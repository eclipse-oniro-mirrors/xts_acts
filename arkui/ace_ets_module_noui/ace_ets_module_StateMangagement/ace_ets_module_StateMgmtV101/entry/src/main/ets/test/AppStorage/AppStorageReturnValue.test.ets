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

export default function AppStorageReturnValue() {
  describe('AppStorageReturnValue', () => {
    beforeEach(async (done: Function) => {
      console.info("AppStorageReturnValue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AppStorage/AppStorageReturnValue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AppStorageReturnValue state pages:" + JSON.stringify(pages));
        if (!("AppStorageReturnValue" == pages.name)) {
          console.info("get AppStorageReturnValue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AppStorageReturnValue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AppStorageReturnValue page error:" + err);
      }
      console.info("AppStorageReturnValue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AppStorageReturnValue after each called");
    });

    /**
     * @tc.name   AppStorageReturnValue_001
     * @tc.number AppStorageReturnValue_001
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_001', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_001] START');
      await CommonFunc.sleep(1000);
      let res1:AbstractProperty<string>  | undefined = AppStorage.ref('noHas');
      console.info("[AppStorageReturnValue_001] component res1 is: " + JSON.stringify(res1));
      expect(res1).assertEqual(undefined);
      console.info('[AppStorageReturnValue_001] END');
      done();
    });

    /**
     * @tc.name   AppStorageReturnValue_002
     * @tc.number AppStorageReturnValue_002
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_002', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_002] START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate('demoHas', 'yes');
      let res2 = AppStorage.Has('demoHas');
      let res3 = AppStorage.Has('demoNotHas');
      console.info("[AppStorageReturnValue_002] component res2 is: " + JSON.stringify(res2));
      console.info("[AppStorageReturnValue_002] component res3 is: " + JSON.stringify(res3));
      expect(res2).assertTrue();
      expect(res3).assertFalse();
      AppStorage.delete('demoHas');
      console.info('[AppStorageReturnValue_002] END');
      done();
    });

    /**
     * @tc.name   AppStorageReturnValue_003
     * @tc.number AppStorageReturnValue_003
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_003', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_003] START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate('demo_has', 'yes');
      let res_0031 = AppStorage.has('demo_has');
      let res_0032 = AppStorage.has('demo_not_has');
      console.info("[AppStorageReturnValue_003] component res_0031 is: " + JSON.stringify(res_0031));
      console.info("[AppStorageReturnValue_003] component res_0032 is: " + JSON.stringify(res_0032));
      expect(res_0031).assertTrue();
      expect(res_0032).assertFalse();
      AppStorage.delete('demo_has');
      console.info('[AppStorageReturnValue_003] END');
      done();
    });

    /**
     * @tc.name   AppStorageReturnValue_004
     * @tc.number AppStorageReturnValue_004
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_004', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_004] START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate('demo004', 'yes');
      let res_0041 = AppStorage.Set('demo004', 'ww');
      let res_0042 = AppStorage.Set('demoNo004', 'ww');
      console.info("[AppStorageReturnValue_004] component res_0041 is: " + JSON.stringify(res_0041));
      console.info("[AppStorageReturnValue_004] component res_0042 is: " + JSON.stringify(res_0042));
      expect(res_0041).assertTrue();
      expect(res_0042).assertFalse();
      AppStorage.delete('demo004');
      console.info('[AppStorageReturnValue_004] END');
      done();
    });

    /**
     * @tc.name   AppStorageReturnValue_005
     * @tc.number AppStorageReturnValue_005
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_005', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_005] START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate('demo005', 'yes');
      let res_0051 = AppStorage.set('demo005', 'ww');
      let res_0052 = AppStorage.set('demoNo005', 'ww');
      console.info("[AppStorageReturnValue_005] component res_0051 is: " + JSON.stringify(res_0051));
      console.info("[AppStorageReturnValue_005] component res_0052 is: " + JSON.stringify(res_0052));
      expect(res_0051).assertTrue();
      expect(res_0052).assertFalse();
      AppStorage.delete('demo005');
      console.info('[AppStorageReturnValue_005] END');
      done();
    });
   
    /**
     * @tc.name   AppStorageReturnValue_006
     * @tc.number AppStorageReturnValue_006
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_006', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_006] START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate('demo006', 'yes');
      let res_0061 = AppStorage.Delete('demo006');
      let res_0062 = AppStorage.Delete('demoNo006');
      console.info("[AppStorageReturnValue_006] component res_0061 is: " + JSON.stringify(res_0061));
      console.info("[AppStorageReturnValue_006] component res_0062 is: " + JSON.stringify(res_0062));
      expect(res_0061).assertTrue();
      expect(res_0062).assertFalse();
      console.info('[AppStorageReturnValue_006] END');
      done();
    });

    /**
     * @tc.name   AppStorageReturnValue_007
     * @tc.number AppStorageReturnValue_007
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_007', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_007] START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate('demo007', 'yes');
      let res_0071 = AppStorage.delete('demo007');
      let res_0072 = AppStorage.delete('demoNo007');
      console.info("[AppStorageReturnValue_007] component res_0071 is: " + JSON.stringify(res_0071));
      console.info("[AppStorageReturnValue_007] component res_0072 is: " + JSON.stringify(res_0072));
      expect(res_0071).assertTrue();
      expect(res_0072).assertFalse();
      console.info('[AppStorageReturnValue_007] END');
      done();
    });
    /**
     * @tc.name   AppStorageReturnValue_008
     * @tc.number AppStorageReturnValue_008
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_008', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_008] START');
      await CommonFunc.sleep(1000);
      let res_0081 = AppStorage.Clear();
      let res_link: SubscribedAbstractProperty<string> = AppStorage.setAndLink('res008', '49');
      let res_0082 = AppStorage.Clear();
      console.info("[AppStorageReturnValue_008] component res_0081 is: " + JSON.stringify(res_0081));
      console.info("[AppStorageReturnValue_008] component res_0082 is: " + JSON.stringify(res_0082));
      expect(res_0081).assertTrue();
      expect(res_0082).assertFalse();
      res_link.aboutToBeDeleted();
      AppStorage.delete('res_link');
      console.info('[AppStorageReturnValue_008] END');
      done();
    });
    /**
     * @tc.name   AppStorageReturnValue_009
     * @tc.number AppStorageReturnValue_009
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_009', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_009] START');
      await CommonFunc.sleep(1000);
      let res_0091 = AppStorage.clear();
      let res009_link: SubscribedAbstractProperty<string> = AppStorage.setAndLink('res009', '49');
      let res_0092 = AppStorage.clear();
      console.info("[AppStorageReturnValue_009] component res_0091 is: " + JSON.stringify(res_0091));
      console.info("[AppStorageReturnValue_009] component res_0092 is: " + JSON.stringify(res_0092));
      expect(res_0091).assertTrue();
      expect(res_0092).assertFalse();
      res009_link.aboutToBeDeleted();
      AppStorage.delete('res009_link');
      console.info('[AppStorageReturnValue_009] END');
      done();
    });

    /**
     * @tc.name   AppStorageReturnValue_010
     * @tc.number AppStorageReturnValue_010
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_010', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_010] START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate('demo010', 'yes');
      let res_0101 = AppStorage.IsMutable('demo010');
      console.info("[AppStorageReturnValue_010] component res_0101 is: " + JSON.stringify(res_0101));
      expect(res_0101).assertTrue();
      AppStorage.delete('demo010');
      console.info('[AppStorageReturnValue_010] END');
      done();
    });

    /**
     * @tc.name   AppStorageReturnValue_011
     * @tc.number AppStorageReturnValue_011
     * @tc.desc   all keys in AppStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppStorageReturnValue_011', Level.LEVEL0, async (done: Function) => {
      console.info('[AppStorageReturnValue_011] START');
      await CommonFunc.sleep(1000);
      let res1:AbstractProperty<string>  | undefined = AppStorage.Get('noHas');
      let res2:AbstractProperty<string>  | undefined = AppStorage.get('noHas');
      console.info("[AppStorageReturnValue_011] component res1 is: " + JSON.stringify(res1));
      console.info("[AppStorageReturnValue_011] component res2 is: " + JSON.stringify(res2));
      expect(res1).assertEqual(undefined);
      expect(res2).assertEqual(undefined);
      console.info('[AppStorageReturnValue_011] END');
      done();
    });

    
  })
}
