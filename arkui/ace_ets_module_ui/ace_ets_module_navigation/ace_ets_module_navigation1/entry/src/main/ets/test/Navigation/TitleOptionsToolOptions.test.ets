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

export default function TitleOptionsToolOptions() {
  describe('TitleOptionsToolOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("TitleOptionsToolOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/TitleOptionsToolOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TitleOptionsToolOptions state pages:" + JSON.stringify(pages));
        if (!("TitleOptionsToolOptions" == pages.name)) {
          console.info("get TitleOptionsToolOptions pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TitleOptionsToolOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TitleOptionsToolOptions page error:" + err);
      }
      console.info("TitleOptionsToolOptions beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TitleOptionsToolOptions after each called");
    });


    /**
     * @tc.name   TitleOptionsToolOptions_0100
     * @tc.number TitleOptionsToolOptions_0100
     * @tc.desc   Test NavigationTitleOptions and NavigationToolbarOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TitleOptionsToolOptions_0100', Level.LEVEL0, async (done: Function) => {
      console.info('TitleOptionsToolOptions_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

      expect(obj1.$children[0].$children[0].$children[0].$attrs.backgroundBlurStyle.value).assertEqual("BlurStyle.BACKGROUND_THIN");
      expect(obj1.$children[0].$children[0].$children[0].$attrs.backgroundColor).assertEqual("#80004AAF");

      let btn2 = await driver.findComponent(ON.text('switch'));
      await btn2.click()
      console.info('[TitleOptionsToolOptions_0100] btn2 click');
      await CommonFunc.sleep(3000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

      expect(obj2.$children[0].$children[0].$children[0].$attrs.backgroundBlurStyle.value).assertEqual("BlurStyle.BACKGROUND_THICK");
      expect(obj2.$children[0].$children[0].$children[0].$attrs.backgroundColor).assertEqual("#802787D9");

      console.info('TitleOptionsToolOptions_0100 END');
      done();
    });

    /**
     * @tc.name   TitleOptionsToolOptions_0200
     * @tc.number TitleOptionsToolOptions_0200
     * @tc.desc   Test NavDestinationTitleOptions and NavDestinationToolbarOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TitleOptionsToolOptions_0200', Level.LEVEL0, async (done: Function) => {
      console.info('TitleOptionsToolOptions_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let push = await driver.findComponent(ON.text('push'));
      await push.click()
      await CommonFunc.sleep(2000);
    
      let getBtn = await driver.findComponent(ON.text('get'));
      await getBtn.click()
      console.info('[TitleOptionsToolOptions_0200] get click');
      await CommonFunc.sleep(2000);

      let backgroundColor: string = AppStorage.get('backgroundColor') as string;
      let backgroundBlurStyle: string = AppStorage.get('backgroundBlurStyle') as string;

      expect(backgroundBlurStyle).assertEqual("BlurStyle.BACKGROUND_THIN");
      expect(backgroundColor).assertEqual("#80004AAF");

      AppStorage.delete('backgroundColor');
      AppStorage.delete('backgroundBlurStyle')

      let btn2 = await driver.findComponent(ON.text('switch'));
      await btn2.click()
      console.info('[TitleOptionsToolOptions_0200] btn2 click');
      await CommonFunc.sleep(3000);

      let getBtn2 = await driver.findComponent(ON.text('get'));
      await getBtn2.click()
      console.info('[TitleOptionsToolOptions_0200] get2 click');
      await CommonFunc.sleep(2000);

      let backgroundColor2: string = AppStorage.get('backgroundColor') as string;
      let backgroundBlurStyle2: string = AppStorage.get('backgroundBlurStyle') as string;
      expect(backgroundBlurStyle2).assertEqual("BlurStyle.BACKGROUND_THICK");
      expect(backgroundColor2).assertEqual("#802787D9");

      AppStorage.delete('backgroundColor');
      AppStorage.delete('backgroundBlurStyle')

      console.info('TitleOptionsToolOptions_0200 END');
      done();
    });

  })
}