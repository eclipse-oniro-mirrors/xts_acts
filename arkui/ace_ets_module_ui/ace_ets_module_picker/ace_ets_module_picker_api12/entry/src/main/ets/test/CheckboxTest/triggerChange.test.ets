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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/common/Utils';

export default function triggerChange() {
  describe('triggerChange', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Checkbox/triggerChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get triggerChange state success " + JSON.stringify(pages));
        if (!("triggerChange" == pages.name)) {
          console.info("get triggerChange state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push triggerChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push triggerChange page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("triggerChange after each called");
    });

    /**
     * @tc.name   triggerChangeTest_0100
     * @tc.number triggerChangeTest_0100
     * @tc.desc   triggerChangeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('triggerChangeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('triggerChangeText_0100 START');
      let strJson = getInspectorByKey('triggerChangeMessage');
      console.info("triggerChangeText_0100 component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("triggerChangeText_0100 component obj is: " + JSON.stringify(obj));
      console.info("[triggerChangeText_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("triggerChange false");
      console.info('triggerChangeText_0100 END');
      done();
    });
  })
}
