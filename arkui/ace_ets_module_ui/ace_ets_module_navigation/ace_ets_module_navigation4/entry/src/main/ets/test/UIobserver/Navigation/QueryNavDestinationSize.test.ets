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

export default function QueryNavDestinationSize() {
  describe('QueryNavDestinationSize', () => {
    beforeEach(async (done: Function) => {
      console.info("QueryNavDestinationSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIobserver/Navigation/QueryNavDestinationSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get QueryNavDestinationSize state pages:" + JSON.stringify(pages));
        if (!("QueryNavDestinationSize" == pages.name)) {
          console.info("get QueryNavDestinationSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push QueryNavDestinationSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push QueryNavDestinationSize page error:" + err);
      }
      console.info("QueryNavDestinationSize beforeEach end");
      done();
    });

    /**
     * @tc.name   QueryNavDestinationSize_0010
     * @tc.number QueryNavDestinationSize_0010
     * @tc.desc   test onNavDestinationSizeChange and offNavDestinationSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('QueryNavDestinationSize_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[QueryNavDestinationSize_0010] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btn: Component = await driver.findComponent(ON.id('onId1'));
      await btn.click();
      console.info('[QueryNavDestinationSize_0010] btn click');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('pushId1'));
      await btn2.click();
      await CommonFunc.sleep(3000);
      console.info('[QueryNavDestinationSize_0010] btn2 click');
      let info2: NavDestinationInfo | undefined = AppStorage.get('navDestinationInfo');
      console.log('QueryNavDestinationSize_0010 get info2: ' + JSON.stringify(info2));
      let size2: Size | undefined = info2?.size;
      let width2: number | undefined = size2?.width;
      let height2: number | undefined = size2?.height;
      expect(width2 && width2 >= 0 && height2 && height2 >= 0).assertTrue();
      AppStorage.delete('navDestinationInfo');

      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('popId1'));
      await btn3.click();
      console.info('[QueryNavDestinationSize_0010] btn3 click');
      await CommonFunc.sleep(1000);

      let btn4: Component = await driver.findComponent(ON.id('offId1'));
      await btn4.click();
      console.info('[QueryNavDestinationSize_0010] btn4 click');
      await CommonFunc.sleep(1000);
      let btn5: Component = await driver.findComponent(ON.id('pushId1'));
      await btn5.click();
      await CommonFunc.sleep(3000);
      console.info('[QueryNavDestinationSize_0010] btn5 click');
      let info3: NavDestinationInfo | undefined = AppStorage.get('navDestinationInfo');
      expect(info3 == undefined).assertTrue();
      AppStorage.delete('navDestinationInfo');
      console.info('[QueryNavDestinationSize_0010] END');
      done();
    });
 })
}