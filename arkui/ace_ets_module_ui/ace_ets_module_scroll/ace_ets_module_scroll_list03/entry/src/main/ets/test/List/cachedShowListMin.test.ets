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

export default function cachedShowListMin() {
  describe('cachedShowListMin', () => {
    beforeEach(async (done: Function) => {
      console.info("cachedShowListMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/cachedShowListMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get cachedShowListMin state pages:" + JSON.stringify(pages));
        if (!("cachedShowListMin" == pages.name)) {
          console.info("get cachedShowListMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push cachedShowListMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push cachedShowListMin page error:" + err);
      }
      console.info("cachedShowListMin beforeEach end");
      done();
    });
    /**
     * @tc.name   cachedShowListMin_0100
     * @tc.number cachedShowListMin_0100
     * @tc.desc   set List cachedCount with show to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cachedShowListMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[cachedShowListMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_cached_show_0');
      console.info("[cachedShowListMin_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[cachedShowListMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[cachedShowListMin_0100] cachedCount: " + JSON.stringify(JSON.parse(strJson).$attrs.cachedCount));
      expect(JSON.parse(strJson).$type).assertEqual("List");
      expect(JSON.parse(strJson).$attrs.cachedCount).assertEqual("0");
      console.info('[cachedShowListMin_0100] END');
      done();
    });

    /**
     * @tc.name   cachedShowListMin_0200
     * @tc.number cachedShowListMin_0200
     * @tc.desc   set List cachedCount with show to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cachedShowListMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[cachedShowListMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_cached_show_negative');
      console.info("[cachedShowListMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[cachedShowListMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[cachedShowListMin_0200] cachedCount: " + JSON.stringify(JSON.parse(strJson).$attrs.cachedCount));
      expect(JSON.parse(strJson).$type).assertEqual("List");
      expect(JSON.parse(strJson).$attrs.cachedCount).assertEqual("1");
      console.info('[cachedShowListMin_0200] END');
      done();
    });
  })
}
