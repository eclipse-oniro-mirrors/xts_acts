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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextHalfLeading() {
  describe('TextHalfLeading', () => {
    beforeAll(() => {
      console.info("TextHalfLeading beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextHalfLeading beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextHalfLeading",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextHalfLeading state pages:" + JSON.stringify(pages));
        if (!("TextHalfLeading" == pages.name)) {
          console.info("get TextHalfLeading pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextHalfLeading page error:" + err);
      }
      console.info("TextHalfLeading beforeEach end");
    }); 


    
    /**
     * @tc.number   TextHalfLeading_static_0010
     * @tc.name     TextHalfLeading_static_0010
     * @tc.desc     TextHalfLeading_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('TextHalfLeading_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextHalfLeading_0010 START');
      let TextHalfLeading_1 = inspector.getInspectorByKey('TextHalfLeading1');
      expect(""+JSON.parseJsonElement(TextHalfLeading_1).getString('$type')).assertEqual('Text');
      console.info('TextHalfLeading_0010 END');
      done();
    });

    
    /**
     * @tc.number   TextHalfLeading_static_0020
     * @tc.name     TextHalfLeading_static_0020
     * @tc.desc     TextHalfLeading_static_0020
     * @tc.level   Level.LEVEL0
     */
    it('TextHalfLeading_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextHalfLeading_0020 START');
      let TextHalfLeading_2 = inspector.getInspectorByKey('TextHalfLeading2');
      expect(""+JSON.parseJsonElement(TextHalfLeading_2).getString('$type')).assertEqual('Text');
      console.info('TextHalfLeading_0020 END');
      done();
    });
  })
}