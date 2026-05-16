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
import accessibility from '@ohos.accessibility'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import config from '@ohos.accessibility.config'
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
// const BUNDLE_NAME = 'com.arkui.ace.information.other/MainAbility';

export default function progressStyleJsunit() {
  describe('progressStyleTest', () => {
    beforeAll(() => {
      console.info("progressStyleTest beforeEach start");
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
        url: 'MainAbility/pages/Progress/progress2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress2" == pages.name)) {
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
      console.info("progressStyle after each called");
    });

    
    /**
     * @tc.number   testprogressStyle_static_0001
     * @tc.name     testprogressStyle_static_0001
     * @tc.desc     testprogressStyle_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testprogressStyle_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Progress');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testprogressStyle0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
  done()
    });

    
    /**
     * @tc.number   testprogressStyle_static_0002
     * @tc.name     testprogressStyle_static_0002
     * @tc.desc     testprogressStyle_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testprogressStyle_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0002] component color strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Progress');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual("#FF008000");
      console.info("[testprogressStyle0002] color value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('color'));
  done()
    });

    
    /**
     * @tc.number   testprogressStyle_static_0003
     * @tc.name     testprogressStyle_static_0003
     * @tc.desc     testprogressStyle_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testprogressStyle_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0003] component value strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Progress');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("50.000000");
      console.info("[testprogressStyle0003] value value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('value'));
  done()
    });

    
    /**
     * @tc.number   testprogressStyle_static_0004
     * @tc.name     testprogressStyle_static_0004
     * @tc.desc     testprogressStyle_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testprogressStyle_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0004] component style strokeWidth strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Progress');
      console.info("[testprogressStyle0004] component style strokeWidth strJson:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      let jsonObject = JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(jsonObject.getString('strokeWidth')).assertEqual("20.00vp");
  done()
    });

    
    /**
     * @tc.number   testprogressStyle_static_0005
     * @tc.name     testprogressStyle_static_0005
     * @tc.desc     testprogressStyle_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testprogressStyle_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0005] component style scaleCount strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Progress');
      let jsonObject = JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(jsonObject.getString('scaleCount')).assertEqual("30");
  done()
    });

    
    /**
     * @tc.number   testprogressStyle_static_0006
     * @tc.name     testprogressStyle_static_0006
     * @tc.desc     testprogressStyle_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testprogressStyle_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('progressStyle testprogressStyle0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Progress');
      console.info("[testprogressStyle0006] component style scaleWidth strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Progress');
      let jsonObject = JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(jsonObject.getString('scaleWidth')).assertEqual("20.00vp");
  done()
    });
  })
}
