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
import CommonFunc from '../MainAbility/common/Common';

export default function GetEventUn() {
  describe('GetEventUn', () => {
    beforeEach(async (done: Function) => {
      console.info("GetEventUn beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GetEventUn",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetEventUn state pages:" + JSON.stringify(pages));
        if (!("GetEventUn" == pages.name)) {
          console.info("get GetEventUn pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GetEventUn page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetEventUn page error:" + err);
      }
      console.info("GetEventUn beforeEach end");
      done();
    });

    /**
     * @tc.number    GetEventUn_001
     * @tc.name      GetEventUn_0100
     * @tc.desc      Set undefined for the typeNode.getEvent.
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('GetEventUn_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[GetEventUn_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('getEvent_undefined'));
      await btn.click();
      console.info("[GetEventUn_0100] Click getEvent_undefined.");
      await CommonFunc.sleep(1500);
      console.info("[GetEventUn_0100] getEventGridUn: " + AppStorage.get('getEventGridUn'));
      expect(AppStorage.get('getEventGridUn')).assertEqual(undefined);
      console.info("[GetEventUn_0100] getEventScrollUn: " + AppStorage.get('getEventScrollUn'));
      expect(AppStorage.get('getEventScrollUn')).assertEqual(undefined);
      console.info("[GetEventUn_0100] getEventListUn: " + AppStorage.get('getEventListUn'));
      expect(AppStorage.get('getEventListUn')).assertEqual(undefined);
      console.info("[GetEventUn_0100] getEventWaterFlowUn: " + AppStorage.get('getEventWaterFlowUn'));
      expect(AppStorage.get('getEventWaterFlowUn')).assertEqual(undefined);

      AppStorage.delete('getEventGridUn')
      AppStorage.delete('getEventScrollUn')
      AppStorage.delete('getEventListUn')
      AppStorage.delete('getEventWaterFlowUn')
      console.info('[GetEventUn_0100] END');
      done();
    });
  })
}