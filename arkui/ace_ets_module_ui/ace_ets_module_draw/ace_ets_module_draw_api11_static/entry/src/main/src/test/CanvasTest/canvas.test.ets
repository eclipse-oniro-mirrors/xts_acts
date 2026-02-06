'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import { startAbility, stopApplication, UtilsTest } from '../Util.test'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function canvasActualBoundingBoxAscentJsunit() {
  describe('canvasActualBoundingBoxAscentTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/canvas',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get canvas state pages:" + JSON.stringify(pages));
        if (!("canvas" == pages.name)) {
          console.info("get canvas pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push canvas page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canvas page error: " + err);
      }
      // done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("canvasActualBoundingBoxAscent after each called");
    });

    
    /**
     * @tc.number   testcanvasAttributes_static_0001
     * @tc.name     testcanvasAttributes_static_0001
     * @tc.desc     testcanvasAttributes_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcanvasAttributes_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testcanvasAttributes_static_0001 testcanvasAttributes0001 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes_static_0001] component width strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Canvas');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")).assertEqual("100.00%");
      console.info("[testcanvasAttributes0001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString("width"));
      done();
    });

    
    /**
     * @tc.number   testcanvasAttributes_static_0002
     * @tc.name     testcanvasAttributes_static_0002
     * @tc.desc     testcanvasAttributes_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testcanvasAttributes_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testcanvasAttributes_static_0002 testcanvasAttributes0002 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes_static_0002] component height strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Canvas');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("height")).assertEqual("100.00%");
      console.info("[testtestcanvasAttributes_static_0002] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString("height"));
      done();
    });

    
    /**
     * @tc.number   testcanvasAttributes_static_0003
     * @tc.name     testcanvasAttributes_static_0003
     * @tc.desc     testcanvasAttributes_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testcanvasAttributes_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testcanvasAttributes_static_0003 testcanvasAttributes0003 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes_static_0003] component backgroundColor strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Canvas');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("backgroundColor")).assertEqual("#FFFFFF00");
      console.info("[testcanvasAttributes_static_0003] backgroundColor value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString("backgroundColor"));
      done();
    });

    
    /**
     * @tc.number   testcanvasAttributes_static_0004
     * @tc.name     testcanvasAttributes_static_0004
     * @tc.desc     testcanvasAttributes_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testcanvasAttributes_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testcanvasAttributes_static_0004 testcanvasAttributes0004 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('Canvas');
      console.info("[testcanvasAttributes_static_0004] component position strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Canvas');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement("position").getString('x'))
        .assertEqual("3.00vp");
      done();
    });

    
    /**
     * @tc.number   testcanvasAttributes_static_0005
     * @tc.name     testcanvasAttributes_static_0005
     * @tc.desc     testcanvasAttributes_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testcanvasAttributes_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testcanvasAttributes_static_0005 testcanvasAttributes0004 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('Canvas');
      console.info("[testtestcanvasAttributes_static_0005] component align strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Canvas');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center");
      console.info("[testtestcanvasAttributes_static_0005] align value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));
      done();
    });
  })
}
