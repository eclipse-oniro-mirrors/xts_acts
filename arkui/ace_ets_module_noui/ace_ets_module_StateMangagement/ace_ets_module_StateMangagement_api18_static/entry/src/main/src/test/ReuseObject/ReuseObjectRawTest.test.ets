'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import { RecordData } from '@ohos.base'

export default function ReuseObjectRawTest() {
  describe('ReuseObjectRawTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ReuseObjectRawTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info('ReuseObjectRawTest startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info("ReuseObjectRawTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ReuseObject/ReuseObjectRaw",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ReuseObjectRawTest state pages: " + JSON.stringify(pages));
        if (!("ReuseObjectRaw" == pages.name)) {
          console.info("get ReuseObjectRawTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ReuseObjectRawTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   ReuseObjectRawTest_0100
     * @tc.name     ReuseObjectRawTest_0100
     * @tc.desc     Test ReuseObject with raw
     * @tc.level    Level.LEVEL0
     */
    it('ReuseObjectRawTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ReuseObjectRawTest_0100 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('ReuseObjectRaw_btn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      console.info("[ReuseObjectRawTest_0100] params.raw is: " + AppStorage.get<RecordData>("ReuseObjectRaw"));
      expect(AppStorage.get<RecordData>("ReuseObjectRaw")).assertEqual('{"message":{"value":"Child1"}}');
      AppStorage.delete('ReuseObjectRaw');

      console.info('[ReuseObjectRawTest_0100] END');
      done();
    });
  });
}
