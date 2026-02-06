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
import { KeyCode } from '@kit.InputKit';
import { MouseButton } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';


export default function errorCreateFromBuilderTest() {
  describe('errorCreateFromBuilderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("errorCreateFromBuilderTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/componentSnapshotCreateFromBuilder/errorCreateFromBuilder",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get errorCreateFromBuilderTest state pages: " + JSON.stringify(pages));
        if (!("getModifierKeyState" == pages.name)) {
          console.info("get errorCreateFromBuilderTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push errorCreateFromBuilderTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push errorCreateFromBuilderTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0010
     * @tc.name      errorCreateFromBuilderTest_0010
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0010 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilder-callback-401'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual('401');
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0010] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0020
     * @tc.name      errorCreateFromBuilderTest_0020
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0020 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilder-callback-100001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(100001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0020] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0030
     * @tc.name      errorCreateFromBuilderTest_0030
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0030 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilder-callback-160001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(160001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0030] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0040
     * @tc.name      errorCreateFromBuilderTest_0040
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0040 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilder-promise-401'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual('401');
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0040] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0050
     * @tc.name      errorCreateFromBuilderTest_0050
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0050 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilder-promise-100001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(100001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0050] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0060
     * @tc.name      errorCreateFromBuilderTest_0060
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0060 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilder-promise-160001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(160001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0060] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0070
     * @tc.name      errorCreateFromBuilderTest_0070
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0070', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0070 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromBuilder-callback-401'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual('401');
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0070] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0080
     * @tc.name      errorCreateFromBuilderTest_0080
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0080', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0080 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromBuilder-callback-100001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(100001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0080] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0090
     * @tc.name      errorCreateFromBuilderTest_0090
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0090', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0090 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromBuilder-callback-160001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(160001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0090] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0100
     * @tc.name      errorCreateFromBuilderTest_0100
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromBuilder-promise-401'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual('401');
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0100] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0110
     * @tc.name      errorCreateFromBuilderTest_0110
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0110', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0110 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromBuilder-promise-100001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(100001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0110] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0120
     * @tc.name      errorCreateFromBuilderTest_0120
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0120', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0120 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromBuilder-promise-160001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(160001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0120] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0130
     * @tc.name      errorCreateFromBuilderTest_0130
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0130', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0130 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromComponent-401'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(401);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0130] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0140
     * @tc.name      errorCreateFromBuilderTest_0140
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0140', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0140 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromComponent-100001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(100001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0140] END');
      done();
    });

    /**
     * @tc.number    errorCreateFromBuilderTest_0150
     * @tc.name      errorCreateFromBuilderTest_0150
     * @tc.desc      errorCreateFromBuilderTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('errorCreateFromBuilderTest_0150', Level.LEVEL0, async (done: Function) => {
      console.info('errorCreateFromBuilderTest_0150 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('UIContext-createFromComponent-160001'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('code')).assertEqual(160001);
      AppStorage.clear();
      console.info('[errorCreateFromBuilderTest_0150] END');
      done();
    });
  })
}
