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
import { describe, afterEach, it, expect, TestType, Size, Level, beforeEach, beforeAll } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

const SLEEP_TIME = 1000;
export default function IdTest() {

describe('IdTest', () => {
    beforeEach(async (done: Function) => {
      console.info("IdTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/IdTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IdTest state pages:" + JSON.stringify(pages));
        if (!("IdTest" == pages.name)) {
          console.info("get IdTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IdTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IdTest page error:" + err);
      }
      console.info("IdTest beforeEach end");
      done();
    });

/**
    * @tc.number Id_Test_0100
    * @tc.name Id_Test_0100
    * @tc.desc Test the id value of resource
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 3
    */
    it('Id_Test_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('Id_Test_0100 START');
      expect(($r("app.string."+"entry_MainAbility").id) > 0).assertTrue();
      console.info('Id_Test_0100 END');
      done();
    })
  })
}