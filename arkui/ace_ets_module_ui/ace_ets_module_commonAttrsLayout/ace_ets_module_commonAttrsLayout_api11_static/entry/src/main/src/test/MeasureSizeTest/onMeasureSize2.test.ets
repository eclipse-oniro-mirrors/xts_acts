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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, ComponentUtils, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function onMeasureSize2() {
  describe('onMeasureSize2', () => {
    console.info("onMeasureSize2 beforeAll start");

    waitForCompletion(async ()=>{await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")})


    const uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!

    beforeAll(async (): Promise<void> => {

    });
    beforeEach(() => {
      console.info("onMeasureSize2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MeasureSize/onMeasureSize2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onMeasureSize2 state pages: " + JSON.stringify(pages));
        if (!("onMeasureSize2" == pages.name)) {
          console.info("get onMeasureSize2 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push onMeasureSize2 page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   onMeasureSize2_static_001
     * @tc.name     onMeasureSize2_static_001
     * @tc.desc     onMeasureSize2_static_001
     * @tc.level    Level.LEVEL0
     */
it('onMeasureSize2_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onMeasureSize2_static_001] START');
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let text_01 = CommonFunc.getComponentRect('onMeasureSize2_text_01');
      let text_02 = CommonFunc.getComponentRect('onMeasureSize2_text_02');
      let text_03 = CommonFunc.getComponentRect('onMeasureSize2_text_03');
      let Column_1 = CommonFunc.getComponentRect('onMeasureSize2_Column_1');

      console.log('assert position')
      expect(Math.abs(Math.round(text_01.left - Column_1.left) - Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(text_01.top - Column_1.top) - Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
      console.log('text_01.left' + text_01.left)
      console.log('text_01.top' + text_01.top)
      expect(Math.abs(Math.round(text_02.left - Column_1.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(text_02.top - Column_1.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('text_02.left' + text_01.left)
      console.log('text_02.top' + text_01.top)

      console.log('Column_1.left' + Column_1.left)
      console.log('Column_1.top' + Column_1.top)

      console.log('assert size')
      expect(Math.abs(Math.round(text_01.right - text_01.left) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      console.log('text_01.right - text_01.left' + (text_01.right - text_01.left))
      expect(Math.abs(Math.round(text_01.bottom - text_01.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      console.log('text_01.bottom - text_01.top' + (text_01.bottom - text_01.top))

      expect(Math.abs(Math.round(text_02.right - text_02.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('text_02.right - text_02.left' + (text_02.right - text_02.left))
      expect(Math.abs(Math.round(text_02.bottom - text_02.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      console.log('text_02.bottom - text_02.top' + (text_02.bottom - text_02.top))

      done();
    });


  })
}
