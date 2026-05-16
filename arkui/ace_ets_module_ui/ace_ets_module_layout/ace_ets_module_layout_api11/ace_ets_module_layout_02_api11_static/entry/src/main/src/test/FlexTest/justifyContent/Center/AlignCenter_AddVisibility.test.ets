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

import { describe, beforeEach, it, expect, Level, afterEach, beforeAll,Level } from '../../../../../../hypium/index'
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import {MessageManager} from '../../../../../ets/MainAbility/common/MessageManager'
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import {Visibility } from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AlignCenter_AddVisibility() {
  describe('AlignCenter_AddVisibility', () => {

    beforeAll(() => {
      console.info("AlignCenter_AddVisibility beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });


    beforeEach(async (): Promise<void> => {
      console.info("AlignCenter_AddVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignCenter_AddVisibility state pages:" + JSON.stringify(pages));
        if (!("AlignCenter_AddVisibility" == pages.name)) {
          console.info("get AlignCenter_AddVisibility pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignCenter_AddVisibility page error:" + err);
      }
      console.info("AlignCenter_AddVisibility beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddVisibility after each called");
    });

    
    
/**
     * @tc.number   testFlexAlignCenterVisibilityNone_static
     * @tc.name     testFlexAlignCenterVisibilityNone_static
     * @tc.desc     testFlexAlignCenterVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignCenterVisibilityNone_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignCenterVisibilityNone] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.None
          });
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Center_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Center_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let Center_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_012');
        let Center_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_013');
        let Center_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_01');
        const uiContext = new UIContext();
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.right - Center_AddVisibility_013.left) <= 1).assertTrue()
        expect(Math.abs((Center_AddVisibility_012.left - Center_AddVisibility_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_01.right - Center_AddVisibility_013.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.right - Center_AddVisibility_012.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.right - Center_AddVisibility_013.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.bottom - Center_AddVisibility_012.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.bottom - Center_AddVisibility_013.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
          .assertTrue();
      } catch (err:Error) {
        console.error('[testFlexAlignCenterVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignCenterVisibilityNone] END');

    });


/**
     * @tc.number   testFlexAlignCenterVisibilityHidden_static
     * @tc.name     testFlexAlignCenterVisibilityHidden_static
     * @tc.desc     testFlexAlignCenterVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignCenterVisibilityHidden_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignCenterVisibilityHidden] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Hidden
          })
        }

        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Center_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Center_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let Center_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_011');
        let Center_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_012');
        let Center_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_013');
        let Center_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_01');
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_011.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_011.right - Center_AddVisibility_012.left) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.right - Center_AddVisibility_013.left) <= 1).assertTrue()
        expect(Math.abs((Center_AddVisibility_011.left - Center_AddVisibility_01.left) - number(AppStorage.get<UIContext>('uiContext')?.vp2px(25))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_01.right - Center_AddVisibility_013.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25))) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_011.right - Center_AddVisibility_011.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.right - Center_AddVisibility_012.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.right - Center_AddVisibility_013.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_011.bottom - Center_AddVisibility_011.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_012.bottom - Center_AddVisibility_012.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_013.bottom - Center_AddVisibility_013.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      } catch (err:Error) {
        console.error('[testFlexAlignCenterVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignCenterVisibilityHidden] END');

    });
    
    
/**
     * @tc.number   testFlexAlignCenterVisibilityVisible_static
     * @tc.name     testFlexAlignCenterVisibilityVisible_static
     * @tc.desc     testFlexAlignCenterVisibilityVisible_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignCenterVisibilityVisible_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignCenterVisibilityVisible_static] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Visible
          })
        }

        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Center_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Center_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        let Center_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_011');
        let Center_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_012');
        let Center_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_013');
        let Center_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_01');
        const uiContext = new UIContext();
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_011.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_011.right - Center_AddVisibility_012.left) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.right - Center_AddVisibility_013.left) <= 1).assertTrue()
        expect(Math.abs((Center_AddVisibility_011.left - Center_AddVisibility_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_01.right - Center_AddVisibility_013.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_011.right - Center_AddVisibility_011.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_012.right - Center_AddVisibility_012.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_013.right - Center_AddVisibility_013.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_011.bottom - Center_AddVisibility_011.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_012.bottom - Center_AddVisibility_012.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_013.bottom - Center_AddVisibility_013.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      } catch (err:Error) {
        console.error('[testFlexAlignCenterVisibilityVisible_static] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignCenterVisibilityVisible_static] END');

    });
  })
}
