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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { UiComponent, UiDriver, Component, Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ProgressCapsuleRadius() {
 describe('ProgressCapsuleRadius', () => {
    beforeEach(async (done: Function) => {
      console.info("ProgressCapsuleRadius beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProgressCapsuleRadius state pages:" + JSON.stringify(pages));
        if (!("ProgressCapsuleRadius" === pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/progress/ProgressCapsuleRadius"})
          await CommonFunc.sleep(2000);
          console.info("push ProgressCapsuleRadius page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProgressCapsuleRadius page error:" + err);
      }
      console.info("ProgressCapsuleRadius foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProgressCapsuleRadius after each called");
    });

    /**
     * @tc.name   testProgressCapsuleRadius0001
     * @tc.number testProgressCapsuleRadius0001
     * @tc.desc   Test progress capsule radius attributes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProgressCapsuleRadius0001', Level.LEVEL2, async (done: Function) => {
      console.info('testProgressCapsuleRadius0001 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('ProgressCapsuleRadius');
      await driver.delayMs(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressCapsuleRadius0001] component width strJson:" + JSON.stringify(strJson));
      expect(obj.$attrs.capsuleStyle.borderRadius).assertEqual("10.00px");
      console.info("[testProgressCapsuleRadius0001] borderRadius value :" + JSON.parse(strJson).$attrs.borderRadius);
      done();
    });

    /**
     * @tc.name   testProgressCapsuleRadius0002
     * @tc.number testProgressCapsuleRadius0002
     * @tc.desc   Test progress capsule radius attributes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProgressCapsuleRadius0002', Level.LEVEL2, async (done: Function) => {
      console.info('testProgressCapsuleRadius0002 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('ProgressCapsuleRadius_negative');
      await driver.delayMs(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressCapsuleRadius0002] component width strJson:" + JSON.stringify(strJson));
      expect(obj.$attrs.capsuleStyle.borderRadius).assertEqual("20.00px");
      console.info("[testProgressCapsuleRadius0002] borderRadius value :" + JSON.parse(strJson).$attrs.borderRadius);
      done();
    });

    /**
     * @tc.name   testProgressCapsuleRadius0003
     * @tc.number testProgressCapsuleRadius0003
     * @tc.desc   Test progress capsule radius attributes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProgressCapsuleRadius0003', Level.LEVEL2, async (done: Function) => {
      console.info('testProgressCapsuleRadius0003 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('ProgressCapsuleRadius_big');
      await driver.delayMs(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressCapsuleRadius0003] component width strJson:" + JSON.stringify(strJson));
      expect(obj.$attrs.capsuleStyle.borderRadius).assertEqual("20.00px");
      console.info("[testProgressCapsuleRadius0003] borderRadius value :" + JSON.parse(strJson).$attrs.borderRadius);
      done();
    });
  })
}
