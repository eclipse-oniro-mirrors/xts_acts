/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SpanOnHoverTest() {
  describe('SpanOnHoverTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SpanOnHoverTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/SpanOnHoverTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SpanOnHoverTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("SpanOnHoverTest" == pages.name)) {
          console.info("get SpanOnHoverTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SpanOnHoverTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpanOnHoverTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("SpanOnHoverTest after each called");
    });

    /**
     * @tc.name   SpanOnHoverTest0001
     * @tc.number SUB_ACE_BASIC_SPAN_ON_HOVER_ETS_API_0001
     * @tc.desc   test span OnHover callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SpanOnHoverTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('SpanOnHoverTest0001 START');
      let span = await driver.findComponent(ON.id('on_hover_span_id'))
      await CommonFunc.sleep(500);
      let point = await span.getBoundsCenter()
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({x:Math.floor(point.x), y:Math.floor(point.y)});
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('spanIsHover')).assertEqual('true');
      expect(''+AppStorage.get('spanOnHoverEvent')).assertContain('"source":1,"target":');
      AppStorage.delete('spanIsHover')
      AppStorage.delete('spanOnHoverEvent')
      console.info("[SpanOnHoverTest0001] end");
      done();
    });
  })
}