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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function searchOnCutJsunit() {
  describe('searchOnCutTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search state success " + JSON.stringify(pages));
        if (!("search" == pages.name)) {
          console.info("get search state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push search page success ");
        }
      } catch (err) {
        console.error("push search page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchOnCut after each called");
    });


    
/**
     * @tc.number   testsearchOnCutStatic0001
     * @tc.name     testsearchOnCutStatic0001
     * @tc.desc     testsearchOnCutStatic0001
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("320.00vp");
      console.info("[testsearchOnCutStatic0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0002
     * @tc.name     testsearchOnCutStatic0002
     * @tc.desc     testsearchOnCutStatic0002
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testsearchOnCutStatic0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0003
     * @tc.name     testsearchOnCutStatic0003
     * @tc.desc     testsearchOnCutStatic0003
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0003', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testsearchOnCutStatic0003] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0004
     * @tc.name     testsearchOnCutStatic0004
     * @tc.desc     testsearchOnCutStatic0004
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0004', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0004 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testsearchOnCutStatic0004] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0005
     * @tc.name     testsearchOnCutStatic0005
     * @tc.desc     testsearchOnCutStatic0005
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0005', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0005 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testsearchOnCutStatic0005] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0006
     * @tc.name     testsearchOnCutStatic0006
     * @tc.desc     testsearchOnCutStatic0006
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0006', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0006 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testsearchOnCutStatic0006] fontColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0007
     * @tc.name     testsearchOnCutStatic0007
     * @tc.desc     testsearchOnCutStatic0007
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0007', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0007 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testsearchOnCutStatic0007] lineHeight value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0009
     * @tc.name     testsearchOnCutStatic0009
     * @tc.desc     testsearchOnCutStatic0009
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0009', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic009 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testsearchOnCutStatic0009] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));

    });


    
/**
     * @tc.number   testsearchOnCutStatic0010
     * @tc.name     testsearchOnCutStatic0010
     * @tc.desc     testsearchOnCutStatic0010
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCutStatic0010', Level.LEVEL0, async (): Promise<void> => {
      console.info('searchOnCut testsearchOnCutStatic0010 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCutStatic0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testsearchOnCutStatic0010] textAlign value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));

    });
  })
}
