/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function ListLanes() {
  describe('ListLanes', () => {
    beforeEach(async (done: Function) => {
      console.info("ListLanes beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListLanes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListLanes state pages: " + JSON.stringify(pages));
        if (!("ListLanes" == pages.name)) {
          console.info("get ListLanes state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListLanes page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListLanes page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ListLanes_001
     * @tc.number ListLanes_001
     * @tc.desc   set gutter to -1vp and listDirection to Axis.Vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ListLanes_001',  Level.LEVEL3, async (done: Function) => {

      console.info('[ListLanes_001] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<Dimension>('value').message.notify({ name:'listGutter', value: '-1vp' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(vp2px(0)));

      console.info('[ListLanes_001] END');
      done();
    });

    /**
     * @tc.name   ListLanes_002
     * @tc.number ListLanes_002
     * @tc.desc   set gutter to 10% and space to 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ListLanes_002',  Level.LEVEL3, async (done: Function) => {

      console.info('[ListLanes_002] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<Dimension>('value').message.notify({ name:'listGutter', value: '10%' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem2 = CommonFunc.getComponentRect('ListItem2');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(ListItem2.top - ListItem0.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();

      console.info('[ListLanes_002] END');
      done();
    });

    /**
     * @tc.name   ListLanes_007
     * @tc.number ListLanes_007
     * @tc.desc   set gutter to 10px and space to 10px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ListLanes_007',  Level.LEVEL3, async (done: Function) => {

      console.info('[ListLanes_007] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<Dimension>('value').message.notify({ name:'listGutter', value: '10px' });
      GlobalContext.getContext().getObject<string>('value').message.notify({ name:'listSpace', value: '10px' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      let ListItem2 = CommonFunc.getComponentRect('ListItem2');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(10));
      expect(Math.round(ListItem2.top - ListItem0.bottom)).assertEqual(Math.round(10));

      console.info('[ListLanes_007] END');
      done();
    });

    /**
     * @tc.name   ListLanes_008
     * @tc.number ListLanes_008
     * @tc.desc   set gutter to 10px and initialIndex to 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ListLanes_008',  Level.LEVEL3, async (done: Function) => {

      console.info('[ListLanes_008] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<Dimension>('value').message.notify({ name:'listGutter', value: '10vp' });
      GlobalContext.getContext().getObject<number>('value').message.notify({ name:'initialIndex', value: 8 });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(ListItem1.left - ListItem0.right) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[ListLanes_008] END');
      done();
    });

    /**
     * @tc.name   ListLanes_009
     * @tc.number ListLanes_009
     * @tc.desc   set padding to 20 and gutter to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ListLanes_009',  Level.LEVEL3, async (done: Function) => {

      console.info('[ListLanes_008] START');
      await CommonFunc.sleep(200);
      let ListLanes = CommonFunc.getComponentRect('ListLanesKey');
      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(ListItem1.left - ListItem0.right) - Math.round(vp2px(10))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem0.left - ListLanes.left) - Math.round(vp2px(20))) <= 1).assertTrue();

      console.info('[ListLanes_008] END');
      done();
    });

    /**
     * @tc.name   ListLanes_010
     * @tc.number ListLanes_010
     * @tc.desc   set margin to 10 and gutter to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ListLanes_010',  Level.LEVEL3, async (done: Function) => {

      console.info('[ListLanes_010] START');
      await CommonFunc.sleep(200);
      let ListLanes = CommonFunc.getComponentRect('ListLanesKey');
      let ListItem0 = CommonFunc.getComponentRect('ListItem0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem1');
      let ColumnKey = CommonFunc.getComponentRect('ColumnKey');
      await CommonFunc.sleep(1000);
      console.log('vp2px(10) is:' +vp2px(10));
      console.log('ListItem0 rect_value is:' +JSON.stringify(ListItem0));
      console.log('ListItem1 rect_value is:' +JSON.stringify(ListItem1));
	  expect(Math.abs(Math.round(ListItem1.left - ListItem0.right) - Math.round(vp2px(10))) <= 1).assertTrue();
      console.log('ListLanes rect_value is:' +JSON.stringify(ListLanes));
      console.log('ColumnKey rect_value is:' +JSON.stringify(ColumnKey));
	  expect(Math.abs(Math.round(ListLanes.top - ColumnKey.top) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[ListLanes_010] END');
      done();
    });

  })
}
