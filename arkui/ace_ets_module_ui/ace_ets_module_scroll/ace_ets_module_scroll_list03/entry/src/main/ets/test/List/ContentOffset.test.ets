/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function ContentOffset() {
  describe('ContentOffset', () => {
    beforeEach(async (done: Function) => {
      console.info("ContentOffset beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ContentOffset",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContentOffset state pages:" + JSON.stringify(pages));
        if (!("ContentOffset" == pages.name)) {
          console.info("get ContentOffset pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ContentOffset page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContentOffset page error:" + err);
      }
      console.info("ContentOffset beforeEach end");
      done();
    });

    /**
     * @tc.name   ContentOffset_0100
     * @tc.number ContentOffset_001
     * @tc.desc   Set content area offset through Resource type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContentOffset_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ContentOffset_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('contentOffset_resource');
      console.info("[ContentOffset_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ContentOffset_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[ContentOffset_0100] contentStartOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentStartOffset));
      console.info("[ContentOffset_0100] contentEndOffset: " + JSON.stringify(JSON.parse(strJson).$attrs.contentEndOffset));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("List");
      expect(JSON.parse(strJson).$attrs.contentStartOffset).assertEqual("20.000000");
      expect(JSON.parse(strJson).$attrs.contentEndOffset).assertEqual("20.000000");
      console.info('[ContentOffset_0100] END');
      done();
    });
  })
}
