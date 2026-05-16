/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackSyncLoadTest() {
  describe('StackSyncLoadTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackSyncLoadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackSyncLoad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackSyncLoad state pages:" + JSON.stringify(pages));
        if (!("StackSyncLoad" == pages.name)) {
          console.info("get StackSyncLoad pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackSyncLoad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackSyncLoad page error:" + err);
      }
      console.info("StackSyncLoad beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
      * @tc.name   StackSyncLoadTest_0100
      * @tc.number SUB_ACE_ARKUI_StackSyncLoadTest_0100
      * @tc.desc   ArkUI API
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('StackSyncLoadTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackSyncLoadTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('StackSyncLoad1');
      let strJson2 = getInspectorByKey('StackSyncLoad2');
      let strJson3 = getInspectorByKey('StackSyncLoad3');
      let strJson4 = getInspectorByKey('StackSyncLoad4');
      console.info('[StackSyncLoadTest_0100]:' + JSON.parse(strJson1).$attrs.alignContent)
      console.info('[StackSyncLoadTest_0100]:' + JSON.parse(strJson2).$attrs.alignContent)
      console.info('[StackSyncLoadTest_0100]:' + JSON.parse(strJson3).$attrs.alignContent)
      console.info('[StackSyncLoadTest_0100]:' + JSON.parse(strJson4).$attrs.alignContent)

      expect(JSON.parse(strJson1).$attrs.alignContent).assertEqual('Alignment.Bottom');
      expect(JSON.parse(strJson2).$attrs.alignContent).assertEqual('Alignment.Bottom');
      expect(JSON.parse(strJson3).$attrs.alignContent).assertEqual('Alignment.Bottom');
      expect(JSON.parse(strJson4).$attrs.alignContent).assertEqual('Alignment.Bottom');
      
      console.info('[StackSyncLoadTest_0100] END');
      done();
    });
  
  })
}