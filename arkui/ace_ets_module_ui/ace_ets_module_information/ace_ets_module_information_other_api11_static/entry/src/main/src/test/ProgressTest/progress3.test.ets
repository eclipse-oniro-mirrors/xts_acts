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
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
let domain: Int = 0x0000;
let tag = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
// const BUNDLE_NAME = 'com.arkui.ace.information.other/MainAbility';

export default function progressScaleCountJsunit() {
  describe('progressScaleCountTest', () => {
    beforeAll(() => {
      console.info("progressScaleCountTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.other.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/progress3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push progress page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("progressScaleCount after each called");
    });

    
    /**
     * @tc.number   testprogressScaleCount_static_0001
     * @tc.name     testprogressScaleCount_static_0001
     * @tc.desc     testprogressScaleCount_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testprogressScaleCount_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressScaleCount testprogressScaleCount0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('progressStyleOptions');
      console.info("[testprogressScaleCount0001] component width strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Progress');
      console.info("[testprogressScaleCount0001] style.scaleCount value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('scaleCount')).assertEqual("15");
      done();
    });

    
    /**
     * @tc.number   testprogressScaleCount_static_0002
     * @tc.name     testprogressScaleCount_static_0002
     * @tc.desc     testprogressScaleCount_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testprogressScaleCount_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressScaleCount testprogressScaleCount0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('progressStyleOptions');
      console.info("[testprogressScaleCount0002] component height strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Progress');
      console.info("[testprogressScaleCount0002] style.scaleWidth value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('scaleWidth')).assertEqual('5.00vp');
      done();
    });
  })
}
