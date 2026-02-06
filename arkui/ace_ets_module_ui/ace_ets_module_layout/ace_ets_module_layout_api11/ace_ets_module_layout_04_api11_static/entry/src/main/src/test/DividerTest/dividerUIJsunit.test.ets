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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import router from '@ohos.router';

import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { LineCapStyle,Length } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

const waitUiReadyMs = 1000;

export default function dividerUIJsunit() {
  describe('dividerUIJsunit', () => {
    beforeAll(() => {
      console.info("dividerUIJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("dividerUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/dividerUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dividerUIJsunit state pages:" + "");
        if (!("dividerUI" == pages.name)) {
          console.info("get dividerUIJsunit state pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000)
        }
      } catch (err) {
          console.error("push dividerUIJsunit page error:" + err);
	        expect().assertFail();
      }
    });

/**
     * @tc.number   dividerUIJsunit_static_0100
     * @tc.name     dividerUIJsunit_static_0100
     * @tc.desc     dividerUIJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
       console.info('dividerUIJsunit_static_0100 START');
       await CommonFunc.sleep(1000);

       let strJson = inspector.getInspectorByKey('divider');
      let obj = JSON.parseJsonElement(strJson);
      console.info("dividerUIJsunit_static_0100'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('BUTT');
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFF0000');
       done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0200
     * @tc.name     dividerUIJsunit_static_0200
     * @tc.desc     dividerUIJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0200 START');
      await CommonFunc.sleep(1000);

      AppStorage.setOrCreate<number|string>("strokeWidth",'30')
      await CommonFunc.sleep(200);
      AppStorage.setOrCreate<LineCapStyle>("lineCapStyle",LineCapStyle.Round)
      await CommonFunc.sleep(200);
      AppStorage.setOrCreate<string>("color",'#FFFFFF')
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0200'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('30.00vp');
     expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('ROUND');
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFFFFFF');
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0300
     * @tc.name     dividerUIJsunit_static_0300
     * @tc.desc     dividerUIJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<LineCapStyle>("lineCapStyle",LineCapStyle.Square)
      await CommonFunc.sleep(2000);

     let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0300'] component obj is: " + obj.getElement('$attrs').getString('lineCap'));
     expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('SQUARE');
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0400
     * @tc.name     dividerUIJsunit_static_0400
     * @tc.desc     dividerUIJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<string|number>("strokeWidth",'-30')
      await CommonFunc.sleep(200);
      await CommonFunc.sleep(200);
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('-30.00vp');
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0500
     * @tc.name     dividerUIJsunit_static_0500
     * @tc.desc     dividerUIJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<Length>("widthK",'1.0')
      await CommonFunc.sleep(2000);
      
      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0500'] component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('width')).assertEqual('1.00vp')
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0600
     * @tc.name     dividerUIJsunit_static_0600
     * @tc.desc     dividerUIJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<boolean>("vertical",true)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0600'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('vertical')));
     expect(obj.getElement('$attrs').getString('vertical')).assertEqual('true');
      done();
    });
    
  })
}