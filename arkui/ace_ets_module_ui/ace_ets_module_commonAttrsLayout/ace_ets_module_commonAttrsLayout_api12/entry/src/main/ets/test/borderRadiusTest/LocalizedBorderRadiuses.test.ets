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

export default function LocalizedBorderRadiuses() {
  describe('LocalizedBorderRadiuses', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalizedBorderRadiuses beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/borderRadius/LocalizedBorderRadiuses',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalizedBorderRadiuses state pages:" + JSON.stringify(pages));
        if (!("LocalizedBorderRadiuses" == pages.name)) {
          console.info("get LocalizedBorderRadiuses pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalizedBorderRadiuses page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalizedBorderRadiuses page error:" + err);
      }
      console.info("LocalizedBorderRadiuses beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalizedBorderRadiuses after each called");
    });


    /**
     * @tc.name   LocalizedBorderRadiuses_0100
     * @tc.number LocalizedBorderRadiuses_0100
     * @tc.desc   Test LocalizedBorderRadiuses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalizedBorderRadiuses_0100', Level.LEVEL0, async (done: Function) => {
      console.info('LocalizedBorderRadiuses_0100 START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('LocalizedBorderRadiuses_col');
      await CommonFunc.sleep(1000);
      console.info("[ObserverNavDestinationId_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.borderRadius.topLeft).assertEqual('20.00vp')
      expect(JSON.parse(strJson1).$attrs.borderRadius.topRight).assertEqual('10.00vp')
      expect(JSON.parse(strJson1).$attrs.borderRadius.bottomLeft).assertEqual('15.00vp')
      expect(JSON.parse(strJson1).$attrs.borderRadius.bottomRight).assertEqual('25.00vp')
      console.info('LocalizedBorderRadiuses_0100 END');
      done();
    });


  })
}