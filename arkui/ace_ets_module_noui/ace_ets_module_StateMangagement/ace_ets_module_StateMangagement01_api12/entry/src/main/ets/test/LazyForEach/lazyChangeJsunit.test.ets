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

export default function lazyChangeJsunit() {
  describe('lazyChangeJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("lazyChangeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/lazyChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get lazyChangeJsunit state pages: " + JSON.stringify(pages));
        if (!("lazyChange" == pages.name)) {
          console.info("get lazyChangeJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push lazyChangeJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push lazyChangeJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("lazyChangeJsunit after each called");
    });

    /* *
    * @tc.number: SUB_ACE_SWIPER_lazyChangeJsunit_0100
    * @tc.name  : lazyChangeJsunit_0100
    * @tc.desc  : Data changes.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('lazyChangeJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('lazyChangeJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('changeType_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_0100] lazyChange success");
      let strJson: string = getInspectorByKey('change_DataType');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[lazyChangeJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('change: data 11');
      console.info('[lazyChangeJsunit_0100] END');
      done();
    });

  })
}

