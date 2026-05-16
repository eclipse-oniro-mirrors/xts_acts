/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function backPressBehaviorList() {
  describe('backPressBehaviorList', () => {
    beforeEach(async (done: Function) => {
      console.info("backPressBehaviorList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/backPressBehaviorList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backPressBehaviorList state pages:" + JSON.stringify(pages));
        if (!("backPressBehaviorList" == pages.name)) {
          console.info("get backPressBehaviorList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push backPressBehaviorList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backPressBehaviorList page error:" + err);
      }
      console.info("backPressBehaviorList beforeEach end");
      done();
    });

    /**
     * @tc.name   backPressBehaviorList_0100
     * @tc.number SUB_ARKUI_LIST_BACKPRESSBEHAVIOR_0100
     * @tc.desc   Test List backPressBehavior closeSwipeAction property with true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backPressBehaviorList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[backPressBehaviorList_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_backPressBehavior_true');
      console.info("[backPressBehaviorList_0100] obj.$type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[backPressBehaviorList_0100] backPressBehavior: " + JSON.stringify(JSON.parse(strJson).$attrs.backPressBehavior));

      expect(JSON.parse(strJson).$type).assertEqual('List');
      console.info('[backPressBehaviorList_0100] END');
      done();
    });

    /**
     * @tc.name   backPressBehaviorList_0200
     * @tc.number SUB_ARKUI_LIST_BACKPRESSBEHAVIOR_0200
     * @tc.desc   Test List backPressBehavior closeSwipeAction property with false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backPressBehaviorList_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[backPressBehaviorList_0200] START');
      let strJson = getInspectorByKey('list_backPressBehavior_false');
      console.info("[backPressBehaviorList_0200] obj.$type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[backPressBehaviorList_0200] backPressBehavior: " + JSON.stringify(JSON.parse(strJson).$attrs.backPressBehavior));

      expect(JSON.parse(strJson).$type).assertEqual('List');
      console.info('[backPressBehaviorList_0200] END');
      done();
    });

    /**
     * @tc.name   backPressBehaviorList_0300
     * @tc.number SUB_ARKUI_LIST_BACKPRESSBEHAVIOR_0300
     * @tc.desc   Test List backPressBehavior closeSwipeAction property with undefined value, should restore to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backPressBehaviorList_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[backPressBehaviorList_0300] START');
      let strJsonDefault: string = getInspectorByKey('list_backPressBehavior_true');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJson: string = getInspectorByKey('list_backPressBehavior_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[backPressBehaviorList_0300] Default: " + JSON.stringify(objDefault.$attrs.backPressBehavior));
      console.info("[backPressBehaviorList_0300] backPressBehavior: " + JSON.stringify(obj.$attrs.backPressBehavior));

      expect(obj.$type).assertEqual('List');
      expect(obj.$attrs.backPressBehavior).assertEqual(objDefault.$attrs.backPressBehavior);
      console.info('[backPressBehaviorList_0300] END');
      done();
    })
  })
}
