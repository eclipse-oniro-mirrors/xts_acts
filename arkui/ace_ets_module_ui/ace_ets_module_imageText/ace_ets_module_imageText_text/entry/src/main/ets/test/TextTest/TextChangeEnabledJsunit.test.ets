/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function TextChangeEnabledJsunit() {
  describe('TextChangeEnabledJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TextChangeEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextChangeEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextChangeEnabledJsunit state pages: " + JSON.stringify(pages));
        if (!("TextChangeEnabled" == pages.name)) {
          console.info("get TextChangeEnabledJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextChangeEnabledJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextChangeEnabledJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   textChangeEnabledJsunit_0100
     * @tc.number SUB_ACE_textChangeEnabledJsunit_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textChangeEnabledJsunit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('textChangeEnabledJsunit_0100 START');
      let strJson = getInspectorByKey('aCanEnable');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textChangeEnabledJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textChangeEnabledJsunit_0100] enabled: " + JSON.stringify(obj.$attrs.enabled));
      expect(obj.$attrs.enabled).assertEqual(false);
      console.info('[textChangeEnabledJsunit_0100] END');
      done();
    });
    /**
     * @tc.name   textChangeEnabledJsunit_0200
     * @tc.number SUB_ACE_textChangeEnabledJsunit_0200
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textChangeEnabledJsunit_0200', Level.LEVEL2, async (done: Function) => {
      console.info('textChangeEnabledJsunit_0200 START');
      let strJson = getInspectorByKey('vCanEnable');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textChangeEnabledJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[textChangeEnabledJsunit_0200] enabled: " + JSON.stringify(obj.$attrs.enabled));
      expect(obj.$attrs.enabled).assertEqual(false);
      console.info('[textChangeEnabledJsunit_0200] END');
      done();
    });

  })
}

