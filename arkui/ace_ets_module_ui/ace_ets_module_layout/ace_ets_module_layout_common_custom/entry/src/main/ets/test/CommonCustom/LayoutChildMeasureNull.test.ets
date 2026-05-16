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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function LayoutChildMeasureNullTest() {
  describe('LayoutChildMeasureNullTest', () => {
    beforeAll(async (done: Function) => {
      console.info("LayoutChildMeasureNull beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonCustom/LayoutChildMeasureNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LayoutChildMeasureNull state success " + JSON.stringify(pages));
        if (!("LayoutChildMeasureNull" == pages.name)) {
          console.info("get LayoutChildMeasureNull state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LayoutChildMeasureNull page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LayoutChildMeasureNull page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   LayoutChildMeasureNullTest_0100
     * @tc.number LayoutChildMeasureNullTest_0100
     * @tc.desc   test measure with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LayoutChildMeasureNullTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('LayoutChildMeasureNullTest_0100 START');

      let child_1 = CommonFunc.getComponentRect('LayoutChildMeasureNullTest_1');
      let child_2 = CommonFunc.getComponentRect('LayoutChildMeasureNullTest_2');
      let child_3 = CommonFunc.getComponentRect('LayoutChildMeasureNullTest_3');

      // test measure is invalid, size is 50vp
      expect(Math.abs(child_1.right - child_1.left - vp2px(50))).assertLess(1);
      expect(Math.abs(child_2.right - child_2.left - vp2px(50))).assertLess(1);
      expect(Math.abs(child_3.right - child_3.left - vp2px(50))).assertLess(1);
      expect(Math.abs(child_1.bottom - child_1.top - vp2px(50))).assertLess(1);
      expect(Math.abs(child_2.bottom - child_2.top - vp2px(50))).assertLess(1);
      expect(Math.abs(child_3.bottom - child_3.top - vp2px(50))).assertLess(1);

      console.info('LayoutChildMeasureNullTest_0100 END');
      done();
    });
  })
}

