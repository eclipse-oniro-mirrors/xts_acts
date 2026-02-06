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
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';

export default function lazyReloadJsunit() {
  describe('lazyReloadJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("lazyReloadJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/lazyReload',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get lazyReloadJsunit state pages: " + JSON.stringify(pages));
        if (!("lazyReload" == pages.name)) {
          console.info("get lazyReloadJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push lazyReloadJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push lazyReloadJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("lazyReloadJsunit after each called");
    });

    /* *
    * @tc.number: SUB_ACE_SWIPER_lazyReloadJsunit_0100
    * @tc.name  : lazyReloadJsunit_0100
    * @tc.desc  : Reload all data.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('lazyReloadJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('lazyReloadJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('reload_Type'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_0100] lazyReload success");

      let strJson: string = getInspectorByKey('reload_Data');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[lazyReloadJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('reload: Hello 10');
      console.info('[lazyReloadJsunit_0100] END');
      done();
    });

  })
}

