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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function Column_Space_String() {
  describe('Column_Space_String', () => {
    beforeAll(async () => {
      console.info("Column_Space_String beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      console.info("Column_Space_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space_String",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Column_Space_String state pages1:" + JSON.stringify(pages));
        if (!("Column_Space_String" == pages?.name)) {
          console.info("get Column_Space_String pages.name:" + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options); //push
          await CommonFunc.sleep(2000);
          pages = routerInstance?.getState();
          console.info("get Column_Space_String state pages2:" + JSON.stringify(pages));
          // console.info("push Column_Space_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Space_String page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Column_Space_String after each called")
    });


    /**
     * @tc.number   testColumnSpace_static
     * @tc.name     testColumnSpace_static
     * @tc.desc     testColumnSpace_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSpace_static', Level.LEVEL0, async () => {
      console.info('[testColumnSpace_static] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: '30'
      // });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: '30'
      });
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[testColumnSpace_static] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[testColumnSpace_static] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[testColumnSpace_static] END');
    });


    /**
     * @tc.number   SUB_ACE_Column_Space_String_TEST_0200
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0200
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0200] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: '50px'
      // });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: '50px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0200] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0200] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 50)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 50)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0200] END');
    });


    /**
     * @tc.number   SUB_ACE_Column_Space_String_TEST_0300
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0300
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0300] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: '50fp'
      // });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: '50fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0300] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0300] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      let context = AppStorage.get<UIContext>('context') // 获取当前上下文实例
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      context!.fp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      context!.fp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_013.bottom - Column_Space_String_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0300] END');
    });


    /**
     * @tc.number   SUB_ACE_Column_Space_String_TEST_0400
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0400
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0400] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: '50lpx'
      // });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: '50lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      console.log('[SUB_ACE_Column_Space_String_TEST_0400] Column_Space_String_011.left - Column_Space_String_01.left',
        +(Column_Space_String_011.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_0400] Column_Space_String_012.left - Column_Space_String_01.left',
        +(Column_Space_String_012.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_0400] Column_Space_String_013.left - Column_Space_String_01.left',
        +(Column_Space_String_013.left - Column_Space_String_01.left))
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0400] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0400] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      let context = AppStorage.get<UIContext>('context') // 获取当前上下文实例
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      context!.lpx2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      context!.lpx2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0400] END');
    });


    /**
     * @tc.number   SUB_ACE_Column_Space_String_TEST_0500
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0500
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0500', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0500] START');
      /*GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addSpace', value: vp2px(10) + 'px'
      });*/
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: AppStorage.get<UIContext>("uiContext")!.vp2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0500] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0500] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0500] END');
    });


    /**
     * @tc.number  SUB_ACE_Column_Space_String_TEST_0600
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0600
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0600
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0600', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0600] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: px2vp(10) + 'vp'
      // });
      let context = AppStorage.get<UIContext>('context') // 获取当前上下文实例
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: context!.px2vp(10) + 'vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0600] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0600] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0600] END');
    });


    /**
     * @tc.number  SUB_ACE_Column_Space_String_TEST_0700
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0700
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0700
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0700', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0700] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: fp2px(10) + 'px'
      // });
      let context = AppStorage.get<UIContext>('context') // 获取当前上下文实例
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: context!.fp2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0700] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0700] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      context!.fp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      context!.fp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0700] END');
    });


    /**
     * @tc.number  SUB_ACE_Column_Space_String_TEST_0800
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0800
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0800
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0800', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0800] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: px2fp(10) + 'fp'
      // });
      let context = AppStorage.get<UIContext>('context') // 获取当前上下文实例
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: context!.px2fp(10) + 'fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0800] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0800] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0800] END');
    });


    /**
     * @tc.number  SUB_ACE_Column_Space_String_TEST_0900
     * @tc.name     SUB_ACE_Column_Space_String_TEST_0900
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_0900
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_0900', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_0900] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: lpx2px(10) + 'px'
      // });
      let context = AppStorage.get<UIContext>('context') // 获取当前上下文实例
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: context!.lpx2px(10) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_0900] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_0900] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      context!.lpx2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      context!.lpx2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_0900] END');
    });


    /**
     * @tc.number  SUB_ACE_Column_Space_String_TEST_1000
     * @tc.name     SUB_ACE_Column_Space_String_TEST_1000
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_1000
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_1000', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_1000] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: px2lpx(10) + 'lpx'
      // });
      let context = AppStorage.get<UIContext>('context') // 获取当前上下文实例
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: context!.px2lpx(10) + 'lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('[SUB_ACE_Column_Space_String_TEST_1000] Column_Space_String_011.left - Column_Space_String_01.left',
        +(Column_Space_String_011.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_1000] Column_Space_String_012.left - Column_Space_String_01.left',
        +(Column_Space_String_012.left - Column_Space_String_01.left))
      console.log('[SUB_ACE_Column_Space_String_TEST_1000] Column_Space_String_013.left - Column_Space_String_01.left',
        +(Column_Space_String_013.left - Column_Space_String_01.left))
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_1000] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_1000] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) - 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) - 10)) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[testColumnSpace_static0] END');
    });


    /**
     * @tc.number  SUB_ACE_Column_Space_String_TEST_1100
     * @tc.name     SUB_ACE_Column_Space_String_TEST_1100
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_1100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_1100', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_01100] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: '3' + '0'
      // });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: '3' + '0'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_01100] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_01100] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_01100] END');
    });


    /**
     * @tc.number  SUB_ACE_Column_Space_String_TEST_1200
     * @tc.name     SUB_ACE_Column_Space_String_TEST_1200
     * @tc.desc     SUB_ACE_Column_Space_String_TEST_1200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_Column_Space_String_TEST_1200', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_String_TEST_1200] START');
      // GlobalContext.getContext().getObject<string>('value').message.notify({
      //   name: 'addSpace', value: '50'
      // });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'addSpace', value: '50'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_String_011: RectValue = CommonFunc.getComponentRect('Column_Space_String_011');
      let Column_Space_String_012: RectValue = CommonFunc.getComponentRect('Column_Space_String_012');
      let Column_Space_String_013: RectValue = CommonFunc.getComponentRect('Column_Space_String_013');
      let Column_Space_String_01: RectValue = CommonFunc.getComponentRect('Column_Space_String_01');
      console.log('assert position')
      expect(Math.floor(Math.abs((Column_Space_String_011.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.left - Column_Space_String_01.left) -
        (Column_Space_String_01.right - Column_Space_String_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_Column_Space_String_TEST_1200] Column_Space_String_012.top - Column_Space_String_011.bottom',
        +(Column_Space_String_012.top - Column_Space_String_011.bottom))
      console.log('[SUB_ACE_Column_Space_String_TEST_1200] Column_Space_String_013.top - Column_Space_String_012.bottom',
        +(Column_Space_String_013.top - Column_Space_String_012.bottom))
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
        (Column_Space_String_013.top - Column_Space_String_012.bottom))) <= 2)
        .assertTrue();
      console.log('assert space')
      expect(Math.floor(Math.abs((Column_Space_String_012.top - Column_Space_String_011.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.top - Column_Space_String_012.bottom) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_String_01.top - Column_Space_String_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.floor(Math.abs((Column_Space_String_011.bottom - Column_Space_String_011.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.bottom - Column_Space_String_012.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.bottom - Column_Space_String_013.top) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(150))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs((Column_Space_String_011.right - Column_Space_String_011.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_012.right - Column_Space_String_012.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_String_013.right - Column_Space_String_013.left) -
      AppStorage.get<UIContext>("uiContext")!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_String_TEST_1200] END');
    });

  })
}