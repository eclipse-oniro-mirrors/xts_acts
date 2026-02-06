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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON, } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function onReadyUndefinedTest() {
  describe('onReadyUndefined', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.richeditor.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("onReadyUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/onReadyUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onReadyUndefined state pages:" + JSON.stringify(pages));
        if (!("onReadyUndefined" == pages.name)) {
          console.info("get onReadyUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onReadyUndefined page error:" + err);
      }
      console.info("onReadyUndefined beforeEach end");
    });

    /**
     * @tc.number    onReadyUndefined_static_0001
     * @tc.name      onReadyUndefined_static_0001
     * @tc.desc      test onReady
     * @tc.level     Level.LEVEL1
     */
    it('onReadyUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onReadyUndefined_static_0001] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('richEditor_text');
      let onReadyValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      console.info('$onReady: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(onReadyValue.asString()).assertEqual('count:0');

      console.info('[onReadyUndefined_static_0001] END');
      done();
    });

  })
}