/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, BY, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function createNodeScrollNullUndefined() {
  describe('createNodeScrollNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("createNodeScrollNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/createNodeScrollNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createNodeScrollNullUndefined state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("createNodeScrollNullUndefined" == pages.name)) {
          console.info("get createNodeScrollNullUndefined pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push createNodeScrollNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createNodeScrollNullUndefined page error:" + err);
      }
      console.info("createNodeScrollNullUndefined beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("createNodeScrollNullUndefined after each called");
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0100
     * @tc.name      createNodeScrollNullUndefined_0100
     * @tc.desc      createNode Scroll null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0100', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeScrollNull] ' + AppStorage.get('createNodeScrollNull'));
      expect(AppStorage.get('createNodeScrollNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeScrollNull')

      console.info('[createNodeScrollUndefined] ' + AppStorage.get('createNodeScrollUndefined'));
      expect(AppStorage.get('createNodeScrollUndefined')).assertEqual(401);
      AppStorage.delete('createNodeScrollUndefined')
      console.info('[createNodeScrollNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0200
     * @tc.name      createNodeScrollNullUndefined_0200
     * @tc.desc      createNode List null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0200', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeListNull] ' + AppStorage.get('createNodeListNull'));
      expect(AppStorage.get('createNodeListNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeListNull')

      console.info('[createNodeListUndefined] ' + AppStorage.get('createNodeListUndefined'));
      expect(AppStorage.get('createNodeListUndefined')).assertEqual(401);
      AppStorage.delete('createNodeListUndefined')
      console.info('[createNodeScrollNullUndefined_0200] END');
      done();
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0300
     * @tc.name      createNodeScrollNullUndefined_0300
     * @tc.desc      createNode ListItem null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0300', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeListItemNull] ' + AppStorage.get('createNodeListItemNull'));
      expect(AppStorage.get('createNodeListItemNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeListItemNull')

      console.info('[createNodeListItemUndefined] ' + AppStorage.get('createNodeListItemUndefined'));
      expect(AppStorage.get('createNodeListItemUndefined')).assertEqual(401);
      AppStorage.delete('createNodeListItemUndefined')
      console.info('[createNodeScrollNullUndefined_0300] END');
      done();
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0400
     * @tc.name      createNodeScrollNullUndefined_0400
     * @tc.desc      createNode ListItemGroup null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0400', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeListItemGroupNull] ' + AppStorage.get('createNodeListItemGroupNull'));
      expect(AppStorage.get('createNodeListItemGroupNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeListItemGroupNull')

      console.info('[createNodeListItemGroupUndefined] ' + AppStorage.get('createNodeListItemGroupUndefined'));
      expect(AppStorage.get('createNodeListItemGroupUndefined')).assertEqual(401);
      AppStorage.delete('createNodeListItemGroupUndefined')
      console.info('[createNodeScrollNullUndefined_0400] END');
      done();
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0500
     * @tc.name      createNodeScrollNullUndefined_0500
     * @tc.desc      createNode WaterFlow null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0500', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeWaterFlowNull] ' + AppStorage.get('createNodeWaterFlowNull'));
      expect(AppStorage.get('createNodeWaterFlowNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeWaterFlowNull')

      console.info('[createNodeWaterFlowUndefined] ' + AppStorage.get('createNodeWaterFlowUndefined'));
      expect(AppStorage.get('createNodeWaterFlowUndefined')).assertEqual(401);
      AppStorage.delete('createNodeWaterFlowUndefined')
      console.info('[createNodeScrollNullUndefined_0500] END');
      done();
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0600
     * @tc.name      createNodeScrollNullUndefined_0600
     * @tc.desc      createNode FlowItem null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0600', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeFlowItemNull] ' + AppStorage.get('createNodeFlowItemNull'));
      expect(AppStorage.get('createNodeFlowItemNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeFlowItemNull')

      console.info('[createNodeFlowItemUndefined] ' + AppStorage.get('createNodeFlowItemUndefined'));
      expect(AppStorage.get('createNodeFlowItemUndefined')).assertEqual(401);
      AppStorage.delete('createNodeFlowItemUndefined')
      console.info('[createNodeScrollNullUndefined_0600] END');
      done();
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0700
     * @tc.name      createNodeScrollNullUndefined_0700
     * @tc.desc      createNode Grid null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0700', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeGridNull] ' + AppStorage.get('createNodeGridNull'));
      expect(AppStorage.get('createNodeGridNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeGridNull')

      console.info('[createNodeGridUndefined] ' + AppStorage.get('createNodeGridUndefined'));
      expect(AppStorage.get('createNodeGridUndefined')).assertEqual(401);
      AppStorage.delete('createNodeGridUndefined')
      console.info('[createNodeScrollNullUndefined_0700] END');
      done();
    });

    /**
     * @tc.number    createNodeScrollNullUndefined_0800
     * @tc.name      createNodeScrollNullUndefined_0800
     * @tc.desc      createNode GridItem null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('createNodeScrollNullUndefined_0800', Level.LEVEL2, async (done: Function) => {
      console.info('createNodeScrollNullUndefined_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[createNodeGridItemNull] ' + AppStorage.get('createNodeGridItemNull'));
      expect(AppStorage.get('createNodeGridItemNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeGridItemNull')

      console.info('[createNodeGridItemUndefined] ' + AppStorage.get('createNodeGridItemUndefined'));
      expect(AppStorage.get('createNodeGridItemUndefined')).assertEqual(401);
      AppStorage.delete('createNodeGridItemUndefined')
      console.info('[createNodeScrollNullUndefined_0800] END');
      done();
    });
  })
}