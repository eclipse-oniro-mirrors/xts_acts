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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function promptNullUndefined() {
  describe('promptNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("promptNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/prompt/promptNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("promptNullUndefined" == pages.name)) {
          console.info("get promptNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push promptNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push promptNullUndefined page error:" + err);
      }
      console.info("promptNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.number    showToastNullUndefined_0100
     * @tc.name      showToastNullUndefined_0100
     * @tc.desc      prompt showToast set null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('showToastNullUndefined_0100', Level.LEVEL2, async (done: Function) => {
      console.info('showToastNullUndefined_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      const button = await driver.findComponent(ON.id('prompt_btn_nullUn'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[showToast_null] ' + AppStorage.get('showToast_null'));
      expect(AppStorage.get('showToast_null')).assertEqual("401");
      AppStorage.delete('showToast_null')

      console.info('[showToast_undefined] ' + AppStorage.get('showToast_undefined'));
      expect(AppStorage.get('showToast_undefined')).assertEqual("401");
      AppStorage.delete('showToast_undefined')
      console.info('[showToastNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.number    showDialogNullUndefined_0200
     * @tc.name      showDialogNullUndefined_0200
     * @tc.desc      prompt showDialog set null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('showDialogNullUndefined_0200', Level.LEVEL2, async (done: Function) => {
      console.info('showDialogNullUndefined_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      const button = await driver.findComponent(ON.id('prompt_btn_nullUn'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[showDialog_null] ' + AppStorage.get('showDialog_null'));
      expect(AppStorage.get('showDialog_null')).assertEqual("401");
      AppStorage.delete('showDialog_null')

      console.info('[showDialog_undefined] ' + AppStorage.get('showDialog_undefined'));
      expect(AppStorage.get('showDialog_undefined')).assertEqual("401");
      AppStorage.delete('showDialog_undefined')
      console.info('[showDialogNullUndefined_0200] END');
      done();
    });

    /**
     * @tc.number    showActionMenuNullUndefined_0300
     * @tc.name      showActionMenuNullUndefined_0300
     * @tc.desc      prompt showActionMenu set null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('showActionMenuNullUndefined_0300', Level.LEVEL2, async (done: Function) => {
      console.info('showActionMenuNullUndefined_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      const button = await driver.findComponent(ON.id('prompt_btn_nullUn'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenu_null] ' + AppStorage.get('showActionMenu_null'));
      expect(AppStorage.get('showActionMenu_null')).assertEqual("401");
      AppStorage.delete('showActionMenu_null')

      console.info('[showActionMenu_undefined] ' + AppStorage.get('showActionMenu_undefined'));
      expect(AppStorage.get('showActionMenu_undefined')).assertEqual("401");
      AppStorage.delete('showActionMenu_undefined')
      console.info('[showActionMenuNullUndefined_0300] END');
      done();
    });

    /**
     * @tc.number    openCustomDialogNullUndefined_0400
     * @tc.name      openCustomDialogNullUndefined_0400
     * @tc.desc      promptAction openCustomDialog set null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('openCustomDialogNullUndefined_0400', Level.LEVEL2, async (done: Function) => {
      console.info('openCustomDialogNullUndefined_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      const button = await driver.findComponent(ON.id('promptAction_btn_nullUn'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[openCustomDialog_null] ' + AppStorage.get('openCustomDialog_null'));
      expect(AppStorage.get('openCustomDialog_null')).assertEqual("401");
      AppStorage.delete('openCustomDialog_null')

      console.info('[openCustomDialog_undefined] ' + AppStorage.get('openCustomDialog_undefined'));
      expect(AppStorage.get('openCustomDialog_undefined')).assertEqual("401");
      AppStorage.delete('openCustomDialog_undefined')
      console.info('[openCustomDialogNullUndefined_0400] END');
      done();
    });

    /**
     * @tc.number    systemShowToastNullUndefined_0500
     * @tc.name      systemShowToastNullUndefined_0500
     * @tc.desc      system prompt showToast set null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('systemShowToastNullUndefined_0500', Level.LEVEL2, async (done: Function) => {
      console.info('systemShowToastNullUndefined_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      const button = await driver.findComponent(ON.id('prompt_system_nullUn'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[showToast_system_null] ' + AppStorage.get('showToast_system_null'));
      expect(AppStorage.get('showToast_system_null')).assertEqual("401");
      AppStorage.delete('showToast_system_null')

      console.info('[showToast_system_undefined] ' + AppStorage.get('showToast_system_undefined'));
      expect(AppStorage.get('showToast_system_undefined')).assertEqual("401");
      AppStorage.delete('showToast_system_undefined')
      console.info('[systemShowToastNullUndefined_0500] END');
      done();
    });

    /**
     * @tc.number    systemShowDialogNullUndefined_0600
     * @tc.name      systemShowDialogNullUndefined_0600
     * @tc.desc      system prompt showDialog set null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('systemShowDialogNullUndefined_0600', Level.LEVEL2, async (done: Function) => {
      console.info('systemShowDialogNullUndefined_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      const button = await driver.findComponent(ON.id('prompt_system_nullUn'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[showDialog_system_null] ' + AppStorage.get('showDialog_system_null'));
      expect(AppStorage.get('showDialog_system_null')).assertEqual("401");
      AppStorage.delete('showDialog_system_null')

      console.info('[showDialog_system_undefined] ' + AppStorage.get('showDialog_system_undefined'));
      expect(AppStorage.get('showDialog_system_undefined')).assertEqual("401");
      AppStorage.delete('showDialog_system_undefined')
      console.info('[systemShowDialogNullUndefined_0600] END');
      done();
    });

    /**
     * @tc.number    systemShowActionMenuNullUndefined_0700
     * @tc.name      systemShowActionMenuNullUndefined_0700
     * @tc.desc      system prompt showActionMenu set null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('systemShowActionMenuNullUndefined_0700', Level.LEVEL2, async (done: Function) => {
      console.info('systemShowActionMenuNullUndefined_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      const button = await driver.findComponent(ON.id('prompt_system_nullUn'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenu_system_null] ' + AppStorage.get('showActionMenu_system_null'));
      expect(AppStorage.get('showActionMenu_system_null')).assertEqual("401");
      AppStorage.delete('showActionMenu_system_null')

      console.info('[showActionMenu_system_undefined] ' + AppStorage.get('showActionMenu_system_undefined'));
      expect(AppStorage.get('showActionMenu_system_undefined')).assertEqual("401");
      AppStorage.delete('showActionMenu_system_undefined')
      console.info('[systemShowActionMenuNullUndefined_0700] END');
      done();
    });

  })
}