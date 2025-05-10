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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function RepeatV1Object() {
  describe('RepeatV1Object', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatV1Object beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatV1Object",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatV1Object state pages:" + JSON.stringify(pages));
        if (!("RepeatV1Object" == pages.name)) {
          console.info("get RepeatV1Object pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatV1Object page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatV1Object page error:" + err);
      }
      console.info("RepeatV1Object beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatV1Object after each called");
    });

    /**
     * @tc.number RepeatV1Object_001
     * @tc.name RepeatV1Object_001
     * @tc.desc Test RepeatV1Object component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatV1Object_001', 0, async (done: Function) => {
      console.info('[RepeatV1Object_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('repeat2_vo10');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatV1Object_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Item id =RepeatItem10');
      console.info('[RepeatV1Object_001] END');

      let strJson1 = getInspectorByKey('repeat2_vo11');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatV1Object_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Item id =RepeatItem11');
      console.info('[RepeatV1Object_001] END');
      done();
    });
  })
}
