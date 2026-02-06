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
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UtilsTest } from '../Util.test'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let flexGrow = 3;
let compareFlexGrow = 1;
const uiContext = new UIContext();
export default function RichEditorApi5() {
  describe('RichEditorApi5', () => {
    beforeAll(() => {
      console.info("RichEditorApi5 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("RichEditorApi5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorApi5',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorApi5 state pages:" + JSON.stringify(pages));
        if (!("RichEditorApi5" == pages.name)) {
          console.info("get RichEditorApi5 pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push RichEditorApi5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorApi5 page error:" + err);
      }
      console.info("RichEditorApi5 beforeEach end");
    });
    afterEach(async () => {
    });

    
    
/**
     * @tc.number   RichEditorApi5_static_0100
     * @tc.name     RichEditorApi5_static_0100
     * @tc.desc     RichEditorApi5_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('RichEditorApi5_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('RichEditorApi5_0100 START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") == 0) {
          let richEditor1 = CommonFunc.getComponentRect('RichEditorApi5')
          let y1 = richEditor1.bottom

          inspector.sendEventByKey('RichEditorApi5',10,"")
          await CommonFunc.sleep(1000);
          let richEditor2 = CommonFunc.getComponentRect('RichEditorApi5')
          let y2 = richEditor2.bottom
          expect(y2).assertLess(y1);


      }

      console.info('RichEditorApi5_0100 END');
      done();
    });

  })
}