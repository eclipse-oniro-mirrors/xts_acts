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

export default function scrollFlingMin() {
  describe('scrollFlingMin', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollFlingMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollFlingMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollFlingMin state pages:" + JSON.stringify(pages));
        if (!("scrollFlingMin" == pages.name)) {
          console.info("get scrollFlingMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollFlingMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollFlingMin page error:" + err);
      }
      console.info("scrollFlingMin beforeEach end");
      done();
    });
    /**
     * @tc.name   scrollFlingMin_0100
     * @tc.number scrollFlingMin_0100
     * @tc.desc   set flingSpeedLimit to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollFlingMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollFlingMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('flingSpeed_0');
      console.info("[scrollFlingMin_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollFlingMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[scrollFlingMin_0100] flingSpeedLimit: " + JSON.stringify(JSON.parse(strJson).$attrs.flingSpeedLimit));
      expect(JSON.parse(strJson).$type).assertEqual("Scroll");
      expect(JSON.parse(strJson).$attrs.flingSpeedLimit).assertEqual("9000.00vp");
      console.info('[scrollFlingMin_0100] END');
      done();
    });

    /**
     * @tc.name   scrollFlingMin_0200
     * @tc.number scrollFlingMin_0200
     * @tc.desc   set flingSpeedLimit to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollFlingMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollFlingMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('flingSpeed_1');
      console.info("[scrollFlingMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollFlingMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[scrollFlingMin_0200] flingSpeedLimit: " + JSON.stringify(JSON.parse(strJson).$attrs.flingSpeedLimit));
      expect(JSON.parse(strJson).$type).assertEqual("Scroll");
      expect(JSON.parse(strJson).$attrs.flingSpeedLimit).assertEqual("1.00vp");
      console.info('[scrollFlingMin_0200] END');
      done();
    });
  })
}
