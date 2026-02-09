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

export default function ButtonApi2() {
  describe('ButtonApi2', () => {

    beforeAll(() => {
      console.info("ButtonApi2 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("ButtonApi2 beforeAll end");
    });

    beforeEach(async () => {
      console.info("ButtonApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Button/ButtonApi2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ButtonApi2 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ButtonApi2 pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ButtonApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ButtonApi2 page error:" + err);
      }
      console.info("ButtonApi2 beforeEach end");
    });

    afterEach(async () => {
    });

    
    /**
     * @tc.number   ButtonApi2_static_0100
     * @tc.name     ButtonApi2_static_0100
     * @tc.desc     ButtonApi2_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ButtonApi2_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('ButtonApi2_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('ButtonApi2_btn1',10,"")
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('ButtonApi2_text1');
      expect(JSON.stringify(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('"after click"');

      console.info('ButtonApi2_static_0100 END');
      done();
    });

  })
}