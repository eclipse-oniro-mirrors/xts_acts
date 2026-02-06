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
import CommonFunc from '../../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function NavDestinationSizeUnique() {
  describe('NavDestinationSizeUnique', () => {
    beforeEach(async (done: Function) => {
      console.info("NavDestinationSizeUnique beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIobserver/Navigation/NavDestinationSizeUnique",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavDestinationSizeUnique state pages:" + JSON.stringify(pages));
        if (!("NavDestinationSizeUnique" == pages.name)) {
          console.info("get NavDestinationSizeUnique pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavDestinationSizeUnique page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavDestinationSizeUnique page error:" + err);
      }
      console.info("NavDestinationSizeUnique beforeEach end");
      done();
    });

    /**
     * @tc.name   NavDestinationSizeUnique_0010
     * @tc.number NavDestinationSizeUnique_0010
     * @tc.desc   test onNavDestinationSizeChangeByUniqueId with uniqueId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('NavDestinationSizeUnique_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[NavDestinationSizeUnique_0010] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[NavDestinationSizeUnique_0010] btn1 click');
      await CommonFunc.sleep(1000);

      let offBtn: Component = await driver.findComponent(ON.id('onId'));
      await offBtn.click();
      console.info('[NavDestinationSizeUnique_0010] offBtn click');
      await CommonFunc.sleep(1000);

      let changeBtn: Component = await driver.findComponent(ON.id('changeSizeId'));
      await changeBtn.click();
      console.info('[NavDestinationSizeUnique_0010] changeBtn click');
      await CommonFunc.sleep(1000);

      let info: NavDestinationInfo | undefined = AppStorage.get('uniqueNavDestinationInfo');
      console.log('NavDestinationSizeUnique_0010 get info: ' + JSON.stringify(info));
      let size: Size | undefined = info?.size;
      let width: number | undefined = size?.width;
      let height: number | undefined = size?.height;
      expect(width && width >= 0 && height && height >= 0).assertTrue();
      AppStorage.delete('uniqueNavDestinationInfo');

      await CommonFunc.sleep(1000);
      let popBtn: Component = await driver.findComponent(ON.id('popId'));
      await popBtn.click();
      console.info('[NavDestinationSizeUnique_0010] popBtn click');
      await CommonFunc.sleep(1000);
      console.info('[NavDestinationSizeUnique_0010] END');
      done();
    });

    /**
     * @tc.name   NavDestinationSizeUnique_0020
     * @tc.number NavDestinationSizeUnique_0020
     * @tc.desc   test offNavDestinationSizeChangeByUniqueId with uniqueId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('NavDestinationSizeUnique_0020', Level.LEVEL3, async (done: Function) => {
      console.info('[NavDestinationSizeUnique_0020] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[NavDestinationSizeUnique_0020] btn1 click');
      await CommonFunc.sleep(1000);

      let offBtn: Component = await driver.findComponent(ON.id('offId'));
      await offBtn.click();
      console.info('[NavDestinationSizeUnique_0020] offBtn click');
      await CommonFunc.sleep(1000);
      AppStorage.delete('uniqueNavDestinationInfo');
      await CommonFunc.sleep(1000);
      let changeBtn: Component = await driver.findComponent(ON.id('changeSizeId'));
      await changeBtn.click();
      console.info('[NavDestinationSizeUnique_0020] changeBtn click');
      await CommonFunc.sleep(3000);

      let info: NavDestinationInfo | undefined = AppStorage.get('uniqueNavDestinationInfo');
      console.log('NavDestinationSizeUnique_0020 get info: ' + JSON.stringify(info));
      expect(info == undefined).assertTrue();
      AppStorage.delete('uniqueNavDestinationInfo');

      await CommonFunc.sleep(1000);
      let popBtn: Component = await driver.findComponent(ON.id('popId'));
      await popBtn.click();
      console.info('[NavDestinationSizeUnique_0020] popBtn click');
      await CommonFunc.sleep(1000);
      console.info('[NavDestinationSizeUnique_0020] END');
      done();
    });

    /**
     * @tc.name   NavDestinationSizeUnique_0030
     * @tc.number NavDestinationSizeUnique_0030
     * @tc.desc   test offNavDestinationSizeChangeByUniqueId with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('NavDestinationSizeUnique_0030', Level.LEVEL3, async (done: Function) => {
      console.info('[NavDestinationSizeUnique_0030] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[NavDestinationSizeUnique_0030] btn1 click');
      await CommonFunc.sleep(1000);

      let offBtn: Component = await driver.findComponent(ON.id('onUnId'));
      await offBtn.click();
      console.info('[NavDestinationSizeUnique_0030] offBtn click');
      await CommonFunc.sleep(1000);

      let changeBtn: Component = await driver.findComponent(ON.id('changeSizeId'));
      await changeBtn.click();
      console.info('[NavDestinationSizeUnique_0030] changeBtn click');
      await CommonFunc.sleep(3000);

      let info: NavDestinationInfo | undefined = AppStorage.get('uniqueNavDestinationInfo');
      console.log('NavDestinationSizeUnique_0030 get info: ' + JSON.stringify(info));
      expect(info == undefined).assertTrue();
      AppStorage.delete('uniqueNavDestinationInfo');

      await CommonFunc.sleep(1000);
      let popBtn: Component = await driver.findComponent(ON.id('popId'));
      await popBtn.click();
      console.info('[NavDestinationSizeUnique_0030] popBtn click');
      await CommonFunc.sleep(1000);
      console.info('[NavDestinationSizeUnique_0030] END');
      done();
    });

    /**
     * @tc.name   NavDestinationSizeUnique_0040
     * @tc.number NavDestinationSizeUnique_0040
     * @tc.desc   test offNavDestinationSizeChangeByUniqueId with Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('NavDestinationSizeUnique_0040', Level.LEVEL3, async (done: Function) => {
      console.info('[NavDestinationSizeUnique_0040] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click();
      console.info('[NavDestinationSizeUnique_0040] btn1 click');
      await CommonFunc.sleep(1000);

      let offBtn: Component = await driver.findComponent(ON.id('onNullId'));
      await offBtn.click();
      console.info('[NavDestinationSizeUnique_0040] offBtn click');
      await CommonFunc.sleep(1000);

      let changeBtn: Component = await driver.findComponent(ON.id('changeSizeId'));
      await changeBtn.click();
      console.info('[NavDestinationSizeUnique_0040] changeBtn click');
      await CommonFunc.sleep(3000);

      let info: NavDestinationInfo | undefined = AppStorage.get('uniqueNavDestinationInfo');
      console.log('NavDestinationSizeUnique_0040 get info: ' + JSON.stringify(info));
      expect(info == undefined).assertTrue();
      AppStorage.delete('uniqueNavDestinationInfo');

      await CommonFunc.sleep(1000);
      let popBtn: Component = await driver.findComponent(ON.id('popId'));
      await popBtn.click();
      console.info('[NavDestinationSizeUnique_0040] popBtn click');
      await CommonFunc.sleep(1000);
      console.info('[NavDestinationSizeUnique_0040] END');
      done();
    });
 })
}