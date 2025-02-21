/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function listItemGroup_Space_Percentage() {
  describe('listItemGroup_Space_Percentage', () => {
    beforeEach(async (done: Function) => {
      console.info("listItemGroup_Space_Percentage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_SpaceChange/listItemGroup_Space_Percentage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_SpaceChange state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get List_SpaceChange pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_SpaceChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_SpaceChange page error:" + err);
      }
      console.info("listItemGroup_Space_Percentage beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      // let driver = await UiDriver.create()
      // await driver.pressBack();
      router.back()
      console.info("listItemGroup_Space_Percentage after each called");
    });


    /**
     * @tc.number SUB_ACE_listItemGroup_Space_Percentage_0100
     * @tc.name testListItemGroupSpacePercentage
     * @tc.desc set the space of listItemGroup to '10%'
     */
    it('SUB_ACE_listItemGroup_Space_Percentage_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_listItemGroup_Space_Percentage_0100] START');
      globalThis.value.message.notify({
        name: 'space1', value: '10%'
      });
      globalThis.value.message.notify({
        name: 'space2', value: '10%'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_01');
      let ListItemGroup_1: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_1');
      let ListItem11: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_11');
      let ListItem12: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_12');
      let ListItem13: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_13');

      let ListItemGroup_2: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_2');
      let ListItem21: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_21');
      let ListItem22: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_22');
      let ListItem23: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_23');

      expect(Math.round(ListItem11.right - ListItem11.left)).assertEqual(vp2px(300));
      expect(Math.round(ListItem11.bottom - ListItem11.top)).assertEqual(Math.round(vp2px(50)));

      console.log('assert the spacing between ListItem11 and ListItem12')
      expect(Math.round(ListItem12.top - ListItem11.bottom)).assertEqual(Math.round(vp2px(52)));
      expect(Math.round(ListItem12.right - ListItem12.left)).assertEqual(vp2px(300));
      expect(Math.round(ListItem12.bottom - ListItem12.top)).assertEqual(Math.round(vp2px(50)));

      console.log('assert the spacing between ListItem12 and ListItem13')
      expect(Math.abs(Math.round(ListItem13.top - ListItem12.bottom) - Math.round(vp2px(52))) <= 1).assertTrue();
      expect(Math.round(ListItem13.right - ListItem13.left)).assertEqual(vp2px(300));
      expect(Math.round(ListItem13.bottom - ListItem13.top)).assertEqual(Math.round(vp2px(50)));

      console.log('assert the spacing between ListItemGroup_1 and ListItemGroup_2')
      expect(Math.round(ListItemGroup_2.top - ListItemGroup_1.bottom)).assertEqual(Math.round(vp2px(52)));
      expect(Math.round(ListItem21.right - ListItem21.left)).assertEqual(vp2px(300));
      expect(Math.round(ListItem21.bottom - ListItem21.top)).assertEqual(Math.round(vp2px(50)));

      console.info('[SUB_ACE_listItemGroup_Space_Percentage_0100] END');
      done();
    });


    /**
     * @tc.number SUB_ACE_listItemGroup_Space_Percentage_0200
     * @tc.name testListItemGroupSpacePercentage
     * @tc.desc set the space of listItemGroup to '100%'
     */
    // it('SUB_ACE_listItemGroup_Space_Percentage_0200', 0, async  (done: Function)=> {
    //   console.info('[SUB_ACE_listItemGroup_Space_Percentage_0200] START');
    //   globalThis.value.message.notify({name:'space1', value:'10%'});
    //   globalThis.value.message.notify({name:'space2', value:'100%'});
    //   await CommonFunc.sleep(1000);
    //   let List01:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_01');
    //   let ListItemGroup_1:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_1');
    //   let ListItem11:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_11');
    //   let ListItem12:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_12');
    //   let ListItem13:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_13');
    //
    //   let ListItemGroup_2:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_2');
    //   let ListItem21:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_21');
    //   let ListItem22:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_22');
    //   let ListItem23:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_23');
    //
    //   expect(Math.round(ListItem11.right - ListItem11.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem11.bottom - ListItem11.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem11 and ListItem12')
    //   expect(Math.round(ListItem12.top - ListItem11.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem12.right - ListItem12.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem12.bottom - ListItem12.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem12 and ListItem13')
    //   expect(Math.round(ListItem13.top - ListItem12.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem13.right - ListItem13.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem13.bottom - ListItem13.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItemGroup_1 and ListItemGroup_2')
    //   expect(Math.round(ListItemGroup_2.top - ListItemGroup_1.bottom)).assertEqual(Math.round(vp2px(52)));
    //   expect(Math.round(ListItem21.right - ListItem21.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem21.bottom - ListItem21.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem21 and ListItem22')
    //   expect(Math.round(ListItem22.top - ListItem21.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem22.right - ListItem22.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem22.bottom - ListItem22.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem22 and ListItem23')
    //   expect(Math.round(ListItem23.top - ListItem22.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem23.right - ListItem23.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem23.bottom - ListItem23.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.info('[SUB_ACE_listItemGroup_Space_Percentage_0200] END');
    //   done();
    // });

    /**
     * @tc.number SUB_ACE_listItemGroup_Space_Percentage_0300
     * @tc.name testListItemGroupSpacePercentage
     * @tc.desc set the space of listItemGroup to '200%'
     */
    // it('SUB_ACE_listItemGroup_Space_Percentage_0300', 0, async  (done: Function)=> {
    //   console.info('[SUB_ACE_listItemGroup_Space_Percentage_0300] START');
    //   globalThis.value.message.notify({name:'space1', value:'10%'});
    //   globalThis.value.message.notify({name:'space2', value:'200%'});
    //   await CommonFunc.sleep(1000);
    //   let List01:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_01');
    //   let ListItemGroup_1:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_1');
    //   let ListItem11:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_11');
    //   let ListItem12:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_12');
    //   let ListItem13:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_13');
    //
    //   let ListItemGroup_2:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_2');
    //   let ListItem21:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_21');
    //   let ListItem22:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_22');
    //   let ListItem23:RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_23');
    //
    //   expect(Math.round(ListItem11.right - ListItem11.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem11.bottom - ListItem11.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem11 and ListItem12')
    //   expect(Math.round(ListItem12.top - ListItem11.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem12.right - ListItem12.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem12.bottom - ListItem12.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem12 and ListItem13')
    //   expect(Math.round(ListItem13.top - ListItem12.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem13.right - ListItem13.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem13.bottom - ListItem13.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItemGroup_1 and ListItemGroup_2')
    //   expect(Math.round(ListItemGroup_2.top - ListItemGroup_1.bottom)).assertEqual(Math.round(vp2px(52)));
    //   expect(Math.round(ListItem21.right - ListItem21.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem21.bottom - ListItem21.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem21 and ListItem22')
    //   expect(Math.round(ListItem22.top - ListItem21.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem22.right - ListItem22.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem22.bottom - ListItem22.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.log('assert the spacing between ListItem22 and ListItem23')
    //   expect(Math.round(ListItem23.top - ListItem22.bottom)).assertEqual(Math.round(vp2px(0)));
    //   expect(Math.round(ListItem23.right - ListItem23.left)).assertEqual(vp2px(300));
    //   expect(Math.round(ListItem23.bottom - ListItem23.top)).assertEqual(Math.round(vp2px(50)));
    //
    //   console.info('[SUB_ACE_listItemGroup_Space_Percentage_0300] END');
    //   done();
    // });

  })
}
