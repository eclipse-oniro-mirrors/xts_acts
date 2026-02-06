'use static';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function triggerChange() {
  describe('triggerChange', () => {

    beforeAll(() => {
      console.info("triggerChange beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("triggerChange beforeAll end");
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Checkbox/triggerChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get triggerChange state success " + JSON.stringify(pages));
        if (!("triggerChange" == pages.name)) {
          console.info("get triggerChange state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.push(options);
          await CommonFunc.sleep(2000);
          // console.info("push triggerChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push triggerChange page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("triggerChange after each called");
    });

    /**
     * @tc.number   triggerChangeTest_static_0100
     * @tc.name     triggerChangeTest_static_0100
     * @tc.desc     triggerChangeTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('triggerChangeTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('triggerChangeText_static_0100 START');
      let strJson = inspector.getInspectorByKey('triggerChangeMessage');
      console.info("triggerChangeText_static_0100 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[triggerChangeText_static_0100] title: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("triggerChange false");
      console.info('triggerChangeText_static_0100 END');
      done();
    });
  })
}
