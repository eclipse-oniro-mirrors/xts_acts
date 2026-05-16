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

export default function contentOffsetMin() {
  describe('contentOffsetMin', () => {
    beforeEach(async (done: Function) => {
      console.info("contentOffsetMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/contentOffset/contentOffsetMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get contentOffsetMin state pages:" + JSON.stringify(pages));
        if (!("contentOffsetMin" == pages.name)) {
          console.info("get contentOffsetMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push contentOffsetMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push contentOffsetMin page error:" + err);
      }
      console.info("contentOffsetMin beforeEach end");
      done();
    });
    /**
     * @tc.name   contentOffsetMin_0100
     * @tc.number contentOffsetMin_0100
     * @tc.desc   set List contentStartOffset and contentEndOffset to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('contentOffsetMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[contentOffsetMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('contentOffset_0');
      console.info("[contentOffsetMin_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[contentOffsetMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[contentOffsetMin_0100] contentStartOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentStartOffset));
      console.info("[contentOffsetMin_0100] contentEndOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentEndOffset));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("List");
      expect(JSON.parse(strJson).$attrs.contentStartOffset).assertEqual("0.000000");
      expect(JSON.parse(strJson).$attrs.contentEndOffset).assertEqual("0.000000");
      console.info('[contentOffsetMin_0100] END');
      done();
    });

    /**
     * @tc.name   contentOffsetMin_0200
     * @tc.number contentOffsetMin_0200
     * @tc.desc   set List contentStartOffset and contentEndOffset to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('contentOffsetMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[contentOffsetMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('contentOffset_negative');
      console.info("[contentOffsetMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[contentOffsetMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[contentOffsetMin_0200] contentStartOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentStartOffset));
      console.info("[contentOffsetMin_0200] contentEndOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentEndOffset));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("List");

      let list = CommonFunc.getComponentRectOnScreen('contentOffset_negative');
      console.info("[contentOffsetMin_0200] list_top is: " + list.top);
      let listItem = CommonFunc.getComponentRectOnScreen('item_min_ne_1');
      console.info("[contentOffsetMin_0200] listItem_top is: " + listItem.top);
      expect(Math.floor(Math.abs(listItem.top - list.top)) <= 1).assertTrue();
      console.info('[contentOffsetMin_0200] END');
      done();
    });
  })
}
