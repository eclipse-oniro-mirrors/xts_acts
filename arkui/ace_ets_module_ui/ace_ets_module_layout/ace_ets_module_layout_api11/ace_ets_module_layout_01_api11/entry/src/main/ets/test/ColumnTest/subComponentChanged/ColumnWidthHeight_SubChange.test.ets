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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from "../../../MainAbility/common/Common";
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function ColumnWidthHeight_SubChange() {
  describe('ColumnSetWidthHeightTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnWidthHeight_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexBase state success " + JSON.stringify(pages));
        if (!("FlexBase" == pages.name)) {
          console.info("get FlexBase state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexBase page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexBase page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 50
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 300
      });
      console.info("FlexBase after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0100
     * @tc.name testColumnSubcomponentModifyHeight
     * @tc.desc Modify the first subcomponent's height.
     */
    it('testColumnSubcomponentModifyHeight',  Level.LEVEL0, async () => {
      console.info('new testColumnSubcomponentModifyHeight START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 80
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(2000);
      let columnWidthHeight_1: RectValue = CommonFunc.getComponentRect('columnWidthHeight_1');
      let columnWidthHeight_2: RectValue = CommonFunc.getComponentRect('columnWidthHeight_2');
      let columnWidthHeight_3: RectValue = CommonFunc.getComponentRect('columnWidthHeight_3');
      let columnWidthHeight: RectValue = CommonFunc.getComponentRect('columnWidthHeight');
      expect(Math.abs(columnWidthHeight.top - columnWidthHeight_1.top) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight_2.top - columnWidthHeight_1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight_3.top - columnWidthHeight_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight.bottom - columnWidthHeight_3.bottom - Math.round(vp2px(10))) <= 1).assertTrue()
      console.info('new testColumnSubcomponentModifyHeight END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0200
     * @tc.name testColumnSubcomponentModifyWidth
     * @tc.desc Modify the first subcomponent's width.
     */
    it('testColumnSubcomponentModifyWidth',  Level.LEVEL0, async () => {
      console.info('new testColumnSubcomponentModifyWidth START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 50
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(2000);
      let columnWidthHeight_1: RectValue = CommonFunc.getComponentRect('columnWidthHeight_1');
      let columnWidthHeight_2: RectValue = CommonFunc.getComponentRect('columnWidthHeight_2');
      let columnWidthHeight_3: RectValue = CommonFunc.getComponentRect('columnWidthHeight_3');
      let columnWidthHeight: RectValue = CommonFunc.getComponentRect('columnWidthHeight');
      expect(Math.abs(columnWidthHeight.top - columnWidthHeight_1.top) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight_2.top - columnWidthHeight_1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight_3.top - columnWidthHeight_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight.bottom - columnWidthHeight_3.bottom - Math.round(vp2px(40))) <= 1).assertTrue()
      console.info('new testColumnSubcomponentModifyWidth END');
    });
  })
}
