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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ModifierTest() {

  describe('ModifierTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DragEvent/DragModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EventLocationInfo state pages: " + JSON.stringify(pages));
        if (!("DragModifier" == pages.name)) {
          console.info("get EventLocationInfo state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push EventLocationInfo success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EventLocationInfo page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("EventLocationInfo after each called");
    });

    /**
     * @tc.name   ModifierTest_0010
     * @tc.number ModifierTest_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ModifierTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('EventLocationInfo_on_beforePanStart_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let startDrag = await driver.findComponent(ON.id('startDrag'));
      let endDrag = await driver.findComponent(ON.id('endDrag'));
      await startDrag.dragTo(endDrag);
      await CommonFunc.sleep(1000);
      console.log('999999999'+AppStorage.get('dragSource2'))
      expect(AppStorage.get('dragSource2')).assertEqual('com.open.harmony.nowear.acetestcommenventapi20');
      expect(AppStorage.get('isRemote2')).assertEqual(false);
      expect(AppStorage.get('dragSource4')).assertEqual('com.open.harmony.nowear.acetestcommenventapi20');
      expect(AppStorage.get('isRemote4')).assertEqual(false);
      expect(AppStorage.get('dragSource5')).assertEqual('com.open.harmony.nowear.acetestcommenventapi20');
      expect(AppStorage.get('isRemote5')).assertEqual(false);
      console.info('[EventLocationInfo_on_beforePanStart_0010] END');
      done();
    });
  })
}