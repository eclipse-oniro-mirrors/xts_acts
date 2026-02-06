/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { Router, router as newRouter } from '@kit.ArkUI'

export default function GetStateByIndexTest() {
  describe('GetStateByIndexTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetStateByIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetStateByIndexTest state pages:" + JSON.stringify(pages));
        if (!("GetStateByIndexPage" == pages.name)) {
          console.info("get GetStateByIndexTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GetStateByIndexTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetStateByIndexTest page error:" + err);
      }
      console.info("GetStateByIndexTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   GetStateByIndexTest_0200
     * @tc.number GetStateByIndexTest_0200
     * @tc.desc   router.getStateByIndex return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetStateByIndexTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('GetStateByIndexTest_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id("getUndefinedBtn"));
      await button1.click();
      await CommonFunc.sleep(1000);

      let stateByIndexUndefined: newRouter.RouterState | undefined = AppStorage.get('stateByIndexUndefined')
      expect(stateByIndexUndefined).assertEqual(undefined);
      AppStorage.delete('stateByIndexUndefined');

      console.info('GetStateByIndexTest_0200 END');
      done();
    });

    /**
     * @tc.name   GetStateByIndexTest_0100
     * @tc.number GetStateByIndexTest_0100
     * @tc.desc   GetStateByIndex Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetStateByIndexTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('GetStateByIndexTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id("getStateByIndex_btn_push"));
      await button1.click();
      await CommonFunc.sleep(1000);

      let button2 = await driver.findComponent(ON.id("getStateByIndex_btn_get"));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('getStateByIndex_content');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GetStateByIndexTest_0100] strJson:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('OK');

      console.info('GetStateByIndexTest_0100 END');
      done();
    });

    /**
     * @tc.name   GetStateByIndexTest_0300
     * @tc.number GetStateByIndexTest_0300
     * @tc.desc   router.getStateByUrl return length > 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetStateByIndexTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('GetStateByIndexTest_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('push2Btn'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let button2 = await driver.findComponent(ON.id('getStateByUrlBtn'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let values: newRouter.RouterState[] | undefined = AppStorage.get('getStateByUrlValue')
      expect(values && values?.length > 0).assertTrue();
      AppStorage.delete('getStateByUrlValue');
      console.info('GetStateByIndexTest_0300 END');
      done();
    });

    /**
     * @tc.name   GetStateByIndexTest_0400
     * @tc.number GetStateByIndexTest_0400
     * @tc.desc   router.getStateByUrl return length == 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetStateByIndexTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('GetStateByIndexTest_0400 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('push2Btn'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let button2 = await driver.findComponent(ON.id('getStateByUrlEmptyBtn'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let values: newRouter.RouterState[] | undefined = AppStorage.get('getStateByUrlValueEmpty')
      expect(values && values?.length == 0).assertTrue();
      AppStorage.delete('getStateByUrlValueEmpty');
      console.info('GetStateByIndexTest_0400 END');
      done();
    });
  })
}