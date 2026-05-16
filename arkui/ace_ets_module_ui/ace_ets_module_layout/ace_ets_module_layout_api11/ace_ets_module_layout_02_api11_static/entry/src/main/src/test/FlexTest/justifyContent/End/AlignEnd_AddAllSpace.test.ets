'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import {Alignment } from '@ohos.arkui.component'
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

export default function AlignEnd_AddAllSpace() {
  describe('AlignEnd_AddAllSpace', () => {

    beforeAll(async (): Promise<void> => {
      console.info("AlignEnd_AddAllSpace beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });


    beforeEach(async (): Promise<void> => {
      console.info("AlignEnd_AddAllSpace beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddAllSpace'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignEnd_AddAllSpace state pages:" + JSON.stringify(pages));
        if (!("AlignEnd_AddAllSpace" == pages.name)) {
          console.info("get AlignEnd_AddAllSpace pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignEnd_AddAllSpace page error:" + err);
      }
      console.info("AlignEnd_AddAllSpace beforeEach end");
    });


    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(2000);
      console.info("AlignAlignEnd_AddAllSpace after each called");
    });



    /**
     * @tc.number   testFlexAlignEndFlexSpaceOverflow_static
     * @tc.name     testFlexAlignEndFlexSpaceOverflow_static
     * @tc.desc     testFlexAlignEndFlexSpaceOverflow_static
     * @tc.level    Level.LEVEL0
     */
    it('testFlexAlignEndFlexSpaceOverflow_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignEndFlexSpaceOverflow] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadAllSpace', value: 30
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey ('End_AddAllSpace_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.End');
      let End_AddAllSpace_011: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_011');
      let End_AddAllSpace_012: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_012');
      let End_AddAllSpace_013: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_013');
      let End_AddAllSpace_01: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01');
      let End_AddAllSpace_01_Box: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01_Box');

      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi1'+ Math.floor(Math.abs(End_AddAllSpace_011.top - End_AddAllSpace_012.top)));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi2'+ Math.floor(Math.abs(End_AddAllSpace_012.top - End_AddAllSpace_013.top)));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi3'+ Math.floor(Math.abs(End_AddAllSpace_012.left - End_AddAllSpace_011.right)));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi4'+ Math.floor(Math.abs(End_AddAllSpace_013.left - End_AddAllSpace_012.right)));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi5'+ Math.floor(Math.abs((End_AddAllSpace_011.left -
      End_AddAllSpace_01.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi6'+ Math.floor(Math.abs((End_AddAllSpace_01.right -
      End_AddAllSpace_013.right) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi7'+ Math.floor(Math.abs((End_AddAllSpace_011.top - End_AddAllSpace_01.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi8'+ Math.floor(Math.abs((End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi9'+ Math.floor(Math.abs((End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top)
        - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi10'+ Math.floor(Math.abs((End_AddAllSpace_011.bottom - End_AddAllSpace_011.top)
        - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi11'+ Math.floor(Math.abs((End_AddAllSpace_012.bottom - End_AddAllSpace_012.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi12'+ Math.floor(Math.abs((End_AddAllSpace_013.bottom - End_AddAllSpace_013.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi13'+ Math.floor(Math.abs((End_AddAllSpace_011.right - End_AddAllSpace_011.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi14'+ Math.floor(Math.abs((End_AddAllSpace_012.right - End_AddAllSpace_012.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))));
      console.info('testFlexAlignEndFlexSpaceOverflow_static_chazhi15'+ Math.floor(Math.abs((End_AddAllSpace_013.right - End_AddAllSpace_013.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))));

      expect(Math.floor(Math.abs(End_AddAllSpace_011.top - End_AddAllSpace_012.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(End_AddAllSpace_012.top - End_AddAllSpace_013.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(End_AddAllSpace_012.left - End_AddAllSpace_011.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(End_AddAllSpace_013.left - End_AddAllSpace_012.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.left - End_AddAllSpace_01.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_01.right - End_AddAllSpace_013.right) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.top - End_AddAllSpace_01.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.bottom - End_AddAllSpace_011.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_012.bottom - End_AddAllSpace_012.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_013.bottom - End_AddAllSpace_013.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.right - End_AddAllSpace_011.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 2).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_012.right - End_AddAllSpace_012.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 3).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_013.right - End_AddAllSpace_013.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 2).assertTrue()

      console.info('[testFlexAlignEndFlexSpaceOverflow] END');
    });


    /**
     * @tc.number   testFlexAlignEndFlexSpaceMeet_static
     * @tc.name     testFlexAlignEndFlexSpaceMeet_static
     * @tc.desc     testFlexAlignEndFlexSpaceMeet_static
     * @tc.level    Level.LEVEL0
     */
    it('testFlexAlignEndFlexSpaceMeet_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignEndFlexSpaceMeet] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadAllSpace', value: 20
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey ('End_AddAllSpace_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.End');
      let End_AddAllSpace_011: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_011');
      let End_AddAllSpace_012: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_012');
      let End_AddAllSpace_013: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_013');
      let End_AddAllSpace_01: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01');
      let End_AddAllSpace_01_Box: RectValue = CommonFunc.getComponentRect('End_AddAllSpace_01_Box');

      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi1'+ Math.floor(Math.abs(End_AddAllSpace_011.top - End_AddAllSpace_012.top)));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi2'+ Math.floor(Math.abs(End_AddAllSpace_012.top - End_AddAllSpace_013.top)));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi3'+ Math.floor(Math.abs(End_AddAllSpace_012.left - End_AddAllSpace_011.right)));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi4'+ Math.floor(Math.abs(End_AddAllSpace_013.left - End_AddAllSpace_012.right)));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi5'+ Math.floor(Math.abs((End_AddAllSpace_011.left - End_AddAllSpace_01.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi6'+ Math.floor(Math.abs((End_AddAllSpace_01.right - End_AddAllSpace_013.right) - 
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi7'+ Math.floor(Math.abs((End_AddAllSpace_011.top - End_AddAllSpace_01.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi8'+ Math.floor(Math.abs((End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi9'+ Math.floor(Math.abs((End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi10'+ Math.floor(Math.abs((End_AddAllSpace_011.right - End_AddAllSpace_011.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi11'+ Math.floor(Math.abs((End_AddAllSpace_012.right - End_AddAllSpace_012.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi12'+ Math.floor(Math.abs((End_AddAllSpace_013.right - End_AddAllSpace_013.left) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi13'+ Math.floor(Math.abs((End_AddAllSpace_011.bottom - End_AddAllSpace_011.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi14'+ Math.floor(Math.abs((End_AddAllSpace_012.bottom - End_AddAllSpace_012.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))));
      console.info('testFlexAlignEndFlexSpaceMeet_static_chazhi15'+ Math.floor(Math.abs((End_AddAllSpace_013.bottom - End_AddAllSpace_013.top) -
        (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));

      expect(Math.floor(Math.abs(End_AddAllSpace_011.top - End_AddAllSpace_012.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(End_AddAllSpace_012.top - End_AddAllSpace_013.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(End_AddAllSpace_012.left - End_AddAllSpace_011.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(End_AddAllSpace_013.left - End_AddAllSpace_012.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.left - End_AddAllSpace_01.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_01.right - End_AddAllSpace_013.right) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.top - End_AddAllSpace_01.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.right - End_AddAllSpace_011.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_012.right - End_AddAllSpace_012.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_013.right - End_AddAllSpace_013.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_011.bottom - End_AddAllSpace_011.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_012.bottom - End_AddAllSpace_012.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((End_AddAllSpace_013.bottom - End_AddAllSpace_013.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();

      console.info('[testFlexAlignEndFlexSpaceMeet] END');
    });
  })
}