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
import {MessageManager} from '../../../../../ets/MainAbility/common/MessageManager'
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
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

export default function AlignSpaceEvenly_AddVisibility() {
  describe('AlignSpaceEvenly_AddVisibility', () => {

    beforeAll(() => {
      console.info("AlignSpaceEvenly_AddVisibility beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("AlignSpaceEvenly_AddVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignSpaceEvenly_AddVisibility state pages:" + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddVisibility" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddVisibility pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddVisibility page error:" + err);
      }
      console.info("AlignSpaceEvenly_AddVisibility beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddVisibility after each called");
    });

    
    
/**
     * @tc.number   textFlexAlignSpaceEvenlyTextVisibilityNone_static
     * @tc.name     textFlexAlignSpaceEvenlyTextVisibilityNone_static
     * @tc.desc     textFlexAlignSpaceEvenlyTextVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('textFlexAlignSpaceEvenlyTextVisibilityNone_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityNone] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.None
          })
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_01.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200 / 3)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200 / 3)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200 / 3)))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();


      } catch (err:Error) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityNone] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityNone] END');

    });
    
    
/**
     * @tc.number   textFlexAlignSpaceEvenlyTextVisibilityHidden_static
     * @tc.name     textFlexAlignSpaceEvenlyTextVisibilityHidden_static
     * @tc.desc     textFlexAlignSpaceEvenlyTextVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('textFlexAlignSpaceEvenlyTextVisibilityHidden_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityHidden] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Hidden
          })
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let SpaceEvenly_AddVisibility_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_011');
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(Math.round(SpaceEvenly_AddVisibility_012.top)) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(Math.round(SpaceEvenly_AddVisibility_012.top)) - Math.round(SpaceEvenly_AddVisibility_011.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_011.left - SpaceEvenly_AddVisibility_01.left) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();


        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_011.right) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.right - SpaceEvenly_AddVisibility_011.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.bottom - SpaceEvenly_AddVisibility_011.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();

      } catch (err:Error) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityHidden] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityHidden] END');

    });
    
    
/**
     * @tc.number   textFlexAlignSpaceEvenlyTextVisibilityVisible_static
     * @tc.name     textFlexAlignSpaceEvenlyTextVisibilityVisible_static
     * @tc.desc     textFlexAlignSpaceEvenlyTextVisibilityVisible_static
     * @tc.level    Level.LEVEL0
     */
it('textFlexAlignSpaceEvenlyTextVisibilityVisible_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityVisible] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Visible
          })
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        let SpaceEvenly_AddVisibility_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_011');
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_011.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_011.left - SpaceEvenly_AddVisibility_01.left) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_011.right) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) * 100) / 100 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(12.5)) * 100) / 100) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.right - SpaceEvenly_AddVisibility_011.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.bottom - SpaceEvenly_AddVisibility_011.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 2)
          .assertTrue();

      } catch (err:Error) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityVisible] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityVisible] END');

    });
  })
}
