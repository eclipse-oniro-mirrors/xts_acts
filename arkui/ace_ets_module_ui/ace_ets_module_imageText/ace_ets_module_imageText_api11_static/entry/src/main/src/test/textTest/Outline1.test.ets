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
import {Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function outline() {
  describe('outline', () => {

    beforeAll(() => {
      console.info("outline beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("outline beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/outline',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get outline state pages:" + JSON.stringify(pages));
        if (!("outline" == pages.name)) {
          console.info("get outline pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push outline page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push outline page error:" + err);
      }
      console.info("outline beforeEach end");
    });


    
    /**
     * @tc.number   outlineStyle_static_0100
     * @tc.name     outlineStyle_static_0100
     * @tc.desc     outlineStyle_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('outlineStyle_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('outlineStyle_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outline');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[outlineStyle_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[outlineStyle_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('outlineStyle')));
      expect(obj.getElement('$attrs').getString('outlineStyle')).assertEqual('OutlineStyle.DASHED');
      console.info('[outlineStyle_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   outlineStyle_static_0200
     * @tc.name     outlineStyle_static_0200
     * @tc.desc     outlineStyle_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('outlineStyle_static_0200', Level.LEVEL2, async (done: ()=>void) => {
      console.info('outlineStyle_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outline');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[outlineStyle_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[outlineStyle_static_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('outlineWidth')));
      expect(obj.getElement('$attrs').getString('outlineWidth')).assertEqual('5.00vp');
      console.info('[outlineStyle_static_0200] END');
      done();
    });

    
    /**
     * @tc.number   outlineStyle_static_0300
     * @tc.name     outlineStyle_static_0300
     * @tc.desc     outlineStyle_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('outlineStyle_static_0300', Level.LEVEL2, async (done: ()=>void) => {
      console.info('outlineStyle_static_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outline');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[outlineStyle_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[outlineStyle_static_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('outlineColor')));
      expect(obj.getElement('$attrs').getString('outlineColor')).assertEqual('#FFAFEEEE');
      console.info('[outlineStyle_static_0300] END');
      done();
    });

    
    /**
     * @tc.number   outlineRadius_static_0400
     * @tc.name     outlineRadius_static_0400
     * @tc.desc     outlineRadius_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('outlineRadius_static_0400', Level.LEVEL2, async (done: ()=>void) => {
      console.info('outlineRadius_static_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outline');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[outlineRadius_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[outlineRadius_static_0400] title: " + JSON.stringify(obj.getElement('$attrs').getString('outlineRadius')));
      expect(obj.getElement('$attrs').getString('outlineRadius')).assertEqual('10.00vp');
      console.info('[outlineRadius_static_0400] END');
      done();
    });
  })
}

