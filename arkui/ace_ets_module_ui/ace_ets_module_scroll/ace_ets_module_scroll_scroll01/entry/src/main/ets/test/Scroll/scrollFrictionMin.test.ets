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
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollFrictionMin() {
  describe('scrollFrictionMin', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollFrictionMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollFrictionMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollFrictionMin state pages:" + JSON.stringify(pages));
        if (!("scrollFrictionMin" == pages.name)) {
          console.info("get scrollFrictionMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollFrictionMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollFrictionMin page error:" + err);
      }
      console.info("scrollFrictionMin beforeEach end");
      done();
    });
    /**
     * @tc.name   scrollFrictionMin_0100
     * @tc.number scrollFrictionMin_0100
     * @tc.desc   set friction to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollFrictionMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollFrictionMin_0100] START');
      await CommonFunc.sleep(1000);
      let scrollNegJson = getInspectorByKey('scroll_friction_negative');
      console.info('[scrollFrictionMin_0100] negative friction: ' + JSON.parse(scrollNegJson).$attrs.friction);

      let strJson = getInspectorByKey('scroll_friction_0');
      console.info('[scrollFrictionMin_0100] strJson friction: ' + JSON.parse(strJson).$attrs.friction);
      expect(JSON.parse(strJson).$type).assertEqual("Scroll");
      expect(JSON.parse(strJson).$attrs.friction).assertEqual(JSON.parse(scrollNegJson).$attrs.friction);
      console.info('[scrollFrictionMin_0100] END');
      done();
    });

    /**
     * @tc.name   scrollFrictionMin_0200
     * @tc.number scrollFrictionMin_0200
     * @tc.desc   set friction to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollFrictionMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollFrictionMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scroll_friction_1');
      console.info("[scrollFrictionMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollFrictionMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[scrollFrictionMin_0200] friction: " + JSON.stringify(JSON.parse(strJson).$attrs.friction));
      expect(JSON.parse(strJson).$type).assertEqual("Scroll");
      expect(JSON.parse(strJson).$attrs.friction).assertEqual(1);
      console.info('[scrollFrictionMin_0200] END');
      done();
    });
  })
}
