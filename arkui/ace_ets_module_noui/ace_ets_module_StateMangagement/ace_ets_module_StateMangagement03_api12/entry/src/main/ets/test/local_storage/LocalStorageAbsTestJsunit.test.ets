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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function LocalStorageAbsTestJsunit() {
  describe('LocalStorageAbsTestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStorageAbsTestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/local_storage/LocalStorageAbs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStorageAbsTestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStorageAbs" == pages.name)) {
          console.info("get LocalStorageAbsTestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStorageAbsTestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorageAbsTestJsunit page error:" + err);
      }
      console.info("LocalStorageAbsTestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalStorageAbsTestJsunit after each called");
    });

    /**
     * @tc.number    LocalStorageAbsTestJsunit_001
     * @tc.name      LocalStorageAbsTestJsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('LocalStorageAbsTestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageAbsTestJsunit_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsNum'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('35');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsStr'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('value');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsBoo'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('false');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsObj'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('value');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsClass'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('00');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsEnum'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('PA');
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsArr'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(1000);
      let obj7: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsMap'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.$attrs.content).assertEqual('value');
      await CommonFunc.sleep(1000);
      let obj8: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsSet'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj9: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsDate'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.$attrs.content).assertEqual('Thu Feb 01 2024');
      await CommonFunc.sleep(1000);
      let obj10: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsNull'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj10 is: " + JSON.stringify(obj10));
      expect(obj10.$attrs.content).assertEqual('Hello,null');
      await CommonFunc.sleep(1000);
      let obj11: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsUnd'));
      console.info("[LocalStorageAbsTestJsunit_001] component obj11 is: " + JSON.stringify(obj11));
      expect(obj11.$attrs.content).assertEqual('Hello,undefined');
      console.info('[LocalStorageAbsTestJsunit_001] END');
      done();
    });

    /**
     * @tc.number    LocalStorageAbsTestJsunit_002
     * @tc.name      LocalStorageAbsTestJsunit_002
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalStorageAbsTestJsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageAbsTestJsunit_002] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsInfo'));
      console.info("[LocalStorageAbsTestJsunit_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Info,localStorageAbsNum');
      console.info('[LocalStorageAbsTestJsunit_002] END');
      done();
    });

    /**
     * @tc.number    LocalStorageAbsTestJsunit_003
     * @tc.name      LocalStorageAbsTestJsunit_003
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalStorageAbsTestJsunit_003', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageAbsTestJsunit_003] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsNotName'));
      console.info("[LocalStorageAbsTestJsunit_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('NotName,undefined');
      console.info('[LocalStorageAbsTestJsunit_003] END');
      done();
    });

    /**
     * @tc.number    LocalStorageAbsTestJsunit_004
     * @tc.name      LocalStorageAbsTestJsunit_004
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalStorageAbsTestJsunit_004', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageAbsTestJsunit_004] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsHasName'));
      console.info("[LocalStorageAbsTestJsunit_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HasName,35');
      console.info('[LocalStorageAbsTestJsunit_004] END');
      done();
    });

    /**
     * @tc.number    LocalStorageAbsTestJsunit_005
     * @tc.name      LocalStorageAbsTestJsunit_005
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalStorageAbsTestJsunit_005', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageAbsTestJsunit_005] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsNotRefName'));
      console.info("[LocalStorageAbsTestJsunit_005] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('NotRefName,44');
      console.info('[LocalStorageAbsTestJsunit_005] END');
      done();
    });

    /**
     * @tc.number    LocalStorageAbsTestJsunit_006
     * @tc.name      LocalStorageAbsTestJsunit_006
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalStorageAbsTestJsunit_006', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageAbsTestJsunit_006] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageAbsHasRefName'));
      console.info("[LocalStorageAbsTestJsunit_006] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HasRefName,value');
      console.info('[LocalStorageAbsTestJsunit_006] END');
      done();
    });

  })
}
