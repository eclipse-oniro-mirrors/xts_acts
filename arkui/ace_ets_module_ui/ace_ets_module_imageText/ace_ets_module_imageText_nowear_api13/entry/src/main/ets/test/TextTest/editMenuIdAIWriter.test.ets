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

export default function editMenuIdAIWriterTest() {
  describe('editMenuIdAIWriterTest', () => {
    beforeEach(async (done: Function) => {
      console.info("editMenuIdAIWriterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/editMenuIdAIWriter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get editMenuIdAIWriterTest state pages:" + JSON.stringify(pages));
        if (!("editMenuIdAIWriter" == pages.name)) {
          console.info("get editMenuIdAIWriterTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push editMenuIdAIWriterTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push editMenuIdAIWriterTest page error:" + err);
      }
      console.info("editMenuIdAIWriterTest beforeEach end");
      done();
    });

    /**
     * @tc.name   editMenuIdAIWriterTest_0100
     * @tc.number editMenuIdAIWriterTest_0100
     * @tc.desc   Text: editMenuIdAIWriter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editMenuIdAIWriterTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('editMenuIdAIWriterTest_0100 START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('TextAreaEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      let density = await driver.getDisplayDensity();
      await CommonFunc.sleep(1000);
      console.info("[editMenuIdAIWriterTest_0100] getDisplayDensity is: " + JSON.stringify(density));
      let strJson = await getInspectorByKey('flag')
      let obj: ESObject = JSON.parse(strJson);
      console.info("[editMenuIdAIWriterTest_0100] component obj is: " + JSON.stringify(obj));
      if(obj.$attrs.content == 'true'){
        await driver.assertComponentExist(ON.text('小艺帮写'));
      }else{
        await driver.assertComponentExist(ON.text('全选'));
      }
      await driver.triggerKey(2070)
      console.info('editMenuIdAIWriterTest_0100 END');
      done();
    });

    /**
     * @tc.name   editMenuIdAIWriterTest_0200
     * @tc.number editMenuIdAIWriterTest_0200
     * @tc.desc   Text: editMenuIdAIWriter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('editMenuIdAIWriterTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('editMenuIdAIWriterTest_0200 START');
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('TextInputEditMenuOptions'));
      await button.longClick();
      await CommonFunc.sleep(2000);
      let density = await driver.getDisplayDensity();
      await CommonFunc.sleep(1000);
      console.info("[editMenuIdAIWriterTest_0200] getDisplayDensity is: " + JSON.stringify(density));
      let strJson = await getInspectorByKey('flag')
      let obj: ESObject = JSON.parse(strJson);
      console.info("[editMenuIdAIWriterTest_0200] component obj is: " + JSON.stringify(obj));
      if(obj.$attrs.content == 'true'){
        await driver.assertComponentExist(ON.text('小艺帮写'));
      }else{
        await driver.assertComponentExist(ON.text('全选'));
      }
      await driver.triggerKey(2070)
      console.info('editMenuIdAIWriterTest_0200 END');
      done();
    });
  })
}