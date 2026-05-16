'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON,MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;



export default function RichEditorMenuType() {
  describe('RichEditorMenuType', () => {
    beforeAll(() => {
      console.info("RichEditorMenuType beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api13.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorMenuType beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorMenuType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditorMenuType state pages:" + JSON.stringify(pages));
        if (!("RichEditorMenuType" == pages.name)) {
          console.info("get RichEditorMenuType pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditorMenuType page error:" + err);
      }
      console.info("RichEditorMenuType beforeEach end");
    });

     
    /**
     * @tc.number   RichEditorMenuType_static_0100
     * @tc.name     RichEditorMenuType_static_0100
     * @tc.desc     RichEditorMenuType_static_0100
     * @tc.level    Level.LEVEL2
     */
it('RichEditorMenuType_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('RichEditorMenuType_0100 START');
      await CommonFunc.sleep(1000);


        let strJson =inspector.getInspectorByKey('richEditorMenuType1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[RichEditorMenuType_0100] component obj is: " + JSON.stringify(obj));
        expect(obj.getString('$type')).assertEqual('RichEditor');

      console.info('[RichEditorMenuType_0100] END');
      done();
    });

    
    /**
     * @tc.number   RichEditorMenuType_static_0200
     * @tc.name     RichEditorMenuType_static_0200
     * @tc.desc     RichEditorMenuType_static_0200
     * @tc.level    Level.LEVEL2
     */
it('RichEditorMenuType_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('RichEditorMenuType_0200 START');
      await CommonFunc.sleep(1000);


        let strJson =inspector.getInspectorByKey('richEditorMenuType2');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[RichEditorMenuType_0200] component obj is: " + JSON.stringify(obj));
        expect(obj.getString('$type')).assertEqual('RichEditor');

      console.info('[RichEditorMenuType_0200] END');
      done();
    });
  })
}


