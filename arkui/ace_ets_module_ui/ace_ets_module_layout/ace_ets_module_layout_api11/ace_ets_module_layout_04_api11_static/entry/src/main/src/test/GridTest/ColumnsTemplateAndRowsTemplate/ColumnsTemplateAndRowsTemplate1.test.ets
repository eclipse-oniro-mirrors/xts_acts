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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
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
let testAbilityContext: common.UIAbilityContext;

export default function ColumnsTemplateAndRowsTemplate1() {
  describe('ColumnsTemplateAndRowsTemplate1', () => {
    beforeAll(() => {
      console.info("ColumnsTemplateAndRowsTemplate1 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnsTemplateAndRowsTemplate1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplate1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnsTemplateAndRowsTemplate1 state pages:" + "");
        if (!("ColumnsTemplateAndRowsTemplate1" == pages.name)) {
          console.info("get ColumnsTemplateAndRowsTemplate1 pages.name:" + "");

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ColumnsTemplateAndRowsTemplate1 page error:" + err);
      }
      console.info("ColumnsTemplateAndRowsTemplate1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(3000);
      const router = AppStorage.get<Router>("router") as Router
      router.replaceUrl({url:'MainAbility/pages/index/index'})
      console.info("ColumnsTemplateAndRowsTemplate1 after each called");
    });


    /**
     * @tc.number   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0100
     * @tc.name     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0100
     * @tc.desc     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0100] START');
        AppStorage.get<MessageManager<int>>('messageManager')?.notify({
          name: 'columnEnd1', value: 2
        })

        await CommonFunc.sleep(2000);

        console.log('get Initial value')
        let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
        let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

        console.log('assert position')
        console.log('GridItem_01.left' + GridItem_01.left)
        console.log('Grid_1.left' + Grid_1.left)
        expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

        console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
        expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();
        console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
        expect(Math.floor(Math.abs((GridItem_01.top - Grid_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1).assertTrue();

        console.log('assert size')
        console.log('GridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
        expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(180)))) <= 1).assertTrue();
        console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
        expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1).assertTrue();


        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0100] END');
        done();
      });


    /**
     * @tc.number   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0200
     * @tc.name     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0200
     * @tc.desc     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
          console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0200] START');
          AppStorage.get<MessageManager<int>>('messageManager')?.notify({
            name: 'columnStart1', value: 2
          })
          await CommonFunc.sleep(1000);

          console.log('get Initial value')
          let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
          let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

          console.log('assert position')

          console.log('assert size')
          console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
          expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1).assertTrue();
          console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
          expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1).assertTrue();

          console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0200] END');
          done();
      });

    /**
     * @tc.number   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0400
     * @tc.name     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0400
     * @tc.desc     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0400] START');
        AppStorage.get<MessageManager<int>>('messageManager')?.notify({
          name: 'columnStart1', value: 5
        })
        await CommonFunc.sleep(2000);
        console.log('get Initial value')
        let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
        let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

        console.log('assert position')
        console.log('GridItem_01.left' + GridItem_01.left)
        console.log('Grid_1.left' + Grid_1.left)
        expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

        console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
        expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();
        console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
        expect(Math.floor(Math.abs((GridItem_01.top - Grid_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();

        console.log('assert size')
        console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
        expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1).assertTrue();
        console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
        expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1).assertTrue();

        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0400] END');
        done();
      });


    /**
     * @tc.number   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0500
     * @tc.name     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0500
     * @tc.desc     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0500', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0500] START');
        AppStorage.get<MessageManager<int>>('messageManager')?.notify({
          name: 'rowStart1', value: 0
        })
        await CommonFunc.sleep(2000);

        console.log('get Initial value')
        let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
        let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

        console.log('assert position')
        console.log('GridItem_01.left' + GridItem_01.left)
        console.log('Grid_1.left' + Grid_1.left)
        expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

        console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
        expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();
        console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
        expect(Math.floor(Math.abs((GridItem_01.top - Grid_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();

        console.log('assert size')
        console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
        expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(120)))) <= 1).assertTrue();
        console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
        expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(120)))) <= 1).assertTrue();

        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0500] END');
        done();
      });


    /**
     * @tc.number   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0600
     * @tc.name     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0600
     * @tc.desc     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_006] START');
        AppStorage.get<MessageManager<int>>('messageManager')?.notify({
          name: 'rowStart1', value: 2
        })
        await CommonFunc.sleep(2000);

        console.log('get Initial value')
        let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
        let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

        console.log('assert position')
        console.log('GridItem_01.left' + GridItem_01.left)
        console.log('Grid_1.left' + Grid_1.left)
        expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

        console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
        expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0)))) <= 1).assertTrue();

        console.log('assert size')
        console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
        expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(120)))) <= 1).assertTrue();
        console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
        expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)))) <= 1).assertTrue();

        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0600] END');
        done();
      });


    /**
     * @tc.number   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700
     * @tc.name     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700
     * @tc.desc     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700] START');
        AppStorage.get<MessageManager<int>>('messageManager')?.notify({
          name: 'rowStart1', value: 5
        })
        await CommonFunc.sleep(2000);

        console.log('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700 get Initial value')
        let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
        let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');


        console.log('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700 assert size')
        expect(Math.floor(Math.abs(GridItem_01.right - GridItem_01.left))).assertEqual(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(120)));
        console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
        expect(Math.floor(Math.abs(GridItem_01.bottom - GridItem_01.top))).assertEqual(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60)));
        console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

        console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_static_0700] END');
        done();
      });


  })
}
