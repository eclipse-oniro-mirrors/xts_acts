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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {GlobalContext} from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from "@ohos.arkui.UIContext";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function Column_Space_Default() {
  describe('Column_Space_Default', () => {
    beforeAll(() => {
      console.info("Column_Space_Default beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Column_Space_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space_Default",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Column_Space_Default state pages:" + JSON.stringify(pages));
        if (!("Column_Space_Default" == pages.name)) {
          console.info("get Column_Space_Default pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Column_Space_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Space_Default page error:" + err);
      }
      console.info("Column_Space_Default beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Column_Space_Default after each called")
    });

    
    



// /*
//      * @tc.number   SUB_ACE_Column_Space_Default_TEST_static_0200
//      * @tc.name     SUB_ACE_Column_Space_Default_TEST_static_0200
//      * @tc.desc     SUB_ACE_Column_Space_Default_TEST_static_0200
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_Column_Space_Default_TEST_static_0200', Level.LEVEL0, async () => {
//       console.info('[SUB_ACE_Column_Space_Default_TEST_static_0200] START');
//       const uiContext = AppStorage.get<UIContext>('uiContext');
//       AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
//         name: 'addSpace1', value: null
//       });
//       await CommonFunc.sleep(3000);
//       console.log('get Initial value')
//       let Column_Space_Default_011: RectValue = CommonFunc.getComponentRect('Column_Space_Default_011');
//       let Column_Space_Default_012: RectValue = CommonFunc.getComponentRect('Column_Space_Default_012');
//       let Column_Space_Default_013: RectValue = CommonFunc.getComponentRect('Column_Space_Default_013');
//       let Column_Space_Default_01: RectValue = CommonFunc.getComponentRect('Column_Space_Default_01');
//       console.log('assert position')
//       expect(Math.abs(Column_Space_Default_011.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_011.right)) <= 1)
//         .assertTrue();
//       expect(Math.abs(Column_Space_Default_012.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_012.right)) <= 1)
//         .assertTrue();
//       expect(Math.abs(Column_Space_Default_013.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_013.right)) <= 1)
//         .assertTrue();
//       expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - (Column_Space_Default_013.top - Column_Space_Default_012.bottom)) <= 1)
//         .assertTrue();
//       console.log('assert space')
//       expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_013.top - Column_Space_Default_012.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
//       console.log('Column_Space_Default_012.top - Column_Space_Default_011.bottom', +(Column_Space_Default_012.top - Column_Space_Default_011.bottom))
//       console.log('Column_Space_Default_013.top - Column_Space_Default_012.bottom', +(Column_Space_Default_013.top - Column_Space_Default_012.bottom))
//       expect(Math.abs(Column_Space_Default_01.top - Column_Space_Default_011.top) <= 1).assertTrue();
//       expect(Column_Space_Default_013.bottom).assertLess(Column_Space_Default_01.bottom);
//       console.log('assert height')
//       expect(Math.abs(Column_Space_Default_011.bottom - Column_Space_Default_011.top - uiContext!.vp2px(50)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_012.bottom - Column_Space_Default_012.top - uiContext!.vp2px(100)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_013.bottom - Column_Space_Default_013.top - uiContext!.vp2px(150)) <= 1).assertTrue();
//       console.log('assert weight')
//       expect(Math.abs(Column_Space_Default_011.right - Column_Space_Default_011.left - uiContext!.vp2px(300)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_012.right - Column_Space_Default_012.left - uiContext!.vp2px(300)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_013.right - Column_Space_Default_013.left - uiContext!.vp2px(300)) <= 1).assertTrue();
//       console.info('[SUB_ACE_Column_Space_Default_TEST_static_0200] END');
//     });
    
    



    /**
     * @tc.number   SUB_ACE_Column_Space_Default_TEST_static_0300
     * @tc.name     SUB_ACE_Column_Space_Default_TEST_static_0300
     * @tc.desc     SUB_ACE_Column_Space_Default_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_static_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_static_0300] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addSpace1', value: -10
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_011: RectValue = CommonFunc.getComponentRect('Column_Space_Default_011');
      let Column_Space_Default_012: RectValue = CommonFunc.getComponentRect('Column_Space_Default_012');
      let Column_Space_Default_013: RectValue = CommonFunc.getComponentRect('Column_Space_Default_013');
      let Column_Space_Default_01: RectValue = CommonFunc.getComponentRect('Column_Space_Default_01');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_011.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_013.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - (Column_Space_Default_013.top - Column_Space_Default_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.top - Column_Space_Default_012.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_012.top - Column_Space_Default_011.bottom', +(Column_Space_Default_012.top - Column_Space_Default_011.bottom))
      console.log('Column_Space_Default_013.top - Column_Space_Default_012.bottom', +(Column_Space_Default_013.top - Column_Space_Default_012.bottom))
      expect(Math.abs(Column_Space_Default_01.top - Column_Space_Default_011.top) <= 1).assertTrue();
      expect(Column_Space_Default_013.bottom).assertLess(Column_Space_Default_01.bottom);
      console.log('assert height')
      expect(Math.abs(Column_Space_Default_011.bottom - Column_Space_Default_011.top - uiContext!.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_012.bottom - Column_Space_Default_012.top - uiContext!.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.bottom - Column_Space_Default_013.top - uiContext!.vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_011.right - Column_Space_Default_011.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_012.right - Column_Space_Default_012.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.right - Column_Space_Default_013.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_static_0300] END');
    });
    
    



    /**
     * @tc.number  SUB_ACE_Column_Space_Default_TEST_static_0400
     * @tc.name     SUB_ACE_Column_Space_Default_TEST_static_0400
     * @tc.desc     SUB_ACE_Column_Space_Default_TEST_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_static_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_static_0400] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addSpace2', value: 'abc'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_021: RectValue = CommonFunc.getComponentRect('Column_Space_Default_021');
      let Column_Space_Default_022: RectValue = CommonFunc.getComponentRect('Column_Space_Default_022');
      let Column_Space_Default_023: RectValue = CommonFunc.getComponentRect('Column_Space_Default_023');
      let Column_Space_Default_02: RectValue = CommonFunc.getComponentRect('Column_Space_Default_02');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_021.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_023.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - (Column_Space_Default_023.top - Column_Space_Default_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.top - Column_Space_Default_022.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_022.top - Column_Space_Default_021.bottom', +(Column_Space_Default_022.top - Column_Space_Default_021.bottom))
      console.log('Column_Space_Default_023.top - Column_Space_Default_022.bottom', +(Column_Space_Default_023.top - Column_Space_Default_022.bottom))
      expect(Math.abs(Column_Space_Default_02.top - Column_Space_Default_021.top) <= 1).assertTrue();
      expect(Column_Space_Default_023.bottom).assertLess(Column_Space_Default_02.bottom);
      console.log('assert height')
      expect(Math.abs(Column_Space_Default_021.bottom - Column_Space_Default_021.top - uiContext!.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.bottom - Column_Space_Default_022.top - uiContext!.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.bottom - Column_Space_Default_023.top - uiContext!.vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_021.right - Column_Space_Default_021.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.right - Column_Space_Default_022.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.right - Column_Space_Default_023.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_static_0400] END');
    });
    
    



    /**
     * @tc.number  SUB_ACE_Column_Space_Default_TEST_static_0500
     * @tc.name     SUB_ACE_Column_Space_Default_TEST_static_0500
     * @tc.desc     SUB_ACE_Column_Space_Default_TEST_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_static_0500', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_static_0500] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addSpace2', value: '80%'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_021: RectValue = CommonFunc.getComponentRect('Column_Space_Default_021');
      let Column_Space_Default_022: RectValue = CommonFunc.getComponentRect('Column_Space_Default_022');
      let Column_Space_Default_023: RectValue = CommonFunc.getComponentRect('Column_Space_Default_023');
      let Column_Space_Default_02: RectValue = CommonFunc.getComponentRect('Column_Space_Default_02');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_021.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_023.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - (Column_Space_Default_023.top - Column_Space_Default_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.top - Column_Space_Default_022.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_022.top - Column_Space_Default_021.bottom', +(Column_Space_Default_022.top - Column_Space_Default_021.bottom))
      console.log('Column_Space_Default_023.top - Column_Space_Default_022.bottom', +(Column_Space_Default_023.top - Column_Space_Default_022.bottom))
      expect(Math.abs(Column_Space_Default_02.top - Column_Space_Default_021.top) <= 1).assertTrue();
      expect(Column_Space_Default_023.bottom).assertLess(Column_Space_Default_02.bottom);
      console.log('assert height')
      expect(Math.abs(Column_Space_Default_021.bottom - Column_Space_Default_021.top - uiContext!.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.bottom - Column_Space_Default_022.top - uiContext!.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.bottom - Column_Space_Default_023.top - uiContext!.vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_021.right - Column_Space_Default_021.left - (uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.right - Column_Space_Default_022.left - (uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.right - Column_Space_Default_023.left - (uiContext!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_static_0500] END');
    });
    
    



// /*
//      * @tc.number   SUB_ACE_Column_Space_Default_TEST_static_0100
//      * @tc.name     SUB_ACE_Column_Space_Default_TEST_static_0100
//      * @tc.desc     SUB_ACE_Column_Space_Default_TEST_static_0100
//      * @tc.level    Level.LEVEL0
//      */
//     it('SUB_ACE_Column_Space_Default_TEST_static_0100', Level.LEVEL0, async () => {
//       console.info('[SUB_ACE_Column_Space_Default_TEST_static_0100] START');
//       const uiContext = AppStorage.get<UIContext>('uiContext');
//       AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
//         name: 'addSpace1', value: undefined
//       });
//       await CommonFunc.sleep(3000);
//       console.log('get Initial value')
//       let Column_Space_Default_011: RectValue = CommonFunc.getComponentRect('Column_Space_Default_011');
//       let Column_Space_Default_012: RectValue = CommonFunc.getComponentRect('Column_Space_Default_012');
//       let Column_Space_Default_013: RectValue = CommonFunc.getComponentRect('Column_Space_Default_013');
//       let Column_Space_Default_01: RectValue = CommonFunc.getComponentRect('Column_Space_Default_01');
//       console.log('assert position')
//       expect(Math.abs(Column_Space_Default_011.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_011.right)) <= 1)
//         .assertTrue();
//       expect(Math.abs(Column_Space_Default_012.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_012.right)) <= 1)
//         .assertTrue();
//       expect(Math.abs(Column_Space_Default_013.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_013.right)) <= 1)
//         .assertTrue();
//       expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - (Column_Space_Default_013.top - Column_Space_Default_012.bottom)) <= 1)
//         .assertTrue();
//       console.log('assert space')
//       expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_013.top - Column_Space_Default_012.bottom - uiContext!.vp2px(0)) <= 1).assertTrue();
//       console.log('Column_Space_Default_012.top - Column_Space_Default_011.bottom', +(Column_Space_Default_012.top - Column_Space_Default_011.bottom))
//       console.log('Column_Space_Default_013.top - Column_Space_Default_012.bottom', +(Column_Space_Default_013.top - Column_Space_Default_012.bottom))
//       expect(Math.abs(Column_Space_Default_01.top - Column_Space_Default_011.top) <= 1).assertTrue();
//       expect(Column_Space_Default_013.bottom).assertLess(Column_Space_Default_01.bottom);
//       console.log('assert height')
//       expect(Math.round(Column_Space_Default_011.bottom - Column_Space_Default_011.top - uiContext!.vp2px(50)) <= 1).assertTrue();
//       expect(Math.round(Column_Space_Default_012.bottom - Column_Space_Default_012.top - uiContext!.vp2px(100)) <= 1).assertTrue();
//       expect(Math.round(Column_Space_Default_013.bottom - Column_Space_Default_013.top - uiContext!.vp2px(150)) <= 1).assertTrue();
//       console.log('assert weight')
//       expect(Math.abs(Column_Space_Default_011.right - Column_Space_Default_011.left - uiContext!.vp2px(300)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_012.right - Column_Space_Default_012.left - uiContext!.vp2px(300)) <= 1).assertTrue();
//       expect(Math.abs(Column_Space_Default_013.right - Column_Space_Default_013.left - uiContext!.vp2px(300)) <= 1).assertTrue();
//       console.info('[SUB_ACE_Column_Space_Default_TEST_static_0100] END');
//     });
  })
}