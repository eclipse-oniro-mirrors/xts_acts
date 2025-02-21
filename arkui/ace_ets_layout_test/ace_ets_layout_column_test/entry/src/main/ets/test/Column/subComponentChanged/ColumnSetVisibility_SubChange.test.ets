/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager, Callback, Message } from '../../../MainAbility/common/MessageManager';

export default function ColumnSetVisibility_SubChange() {
  describe('ColumnSetVisibilityTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetVisibility_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetVisibility state success " + JSON.stringify(pages));
        if (!("ColumnSetVisibility_SubChange" == pages.name)) {
          console.info("get ColumnSetVisibility state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetVisibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("ColumnSetVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2000
     * @tc.name testColumnSetVisibilityNoneVisible
     * @tc.desc The subcomponents set visibility.none and visibility.visible.
     */
    it('testColumnSetVisibilityNoneVisible', 0, async () => {
      console.info('new testColumnSetVisibilityNoneVisible START');
      try {
        globalThis.value.message.notify({
          name: 'testVisibility1', value: Visibility.None
        });
        globalThis.value.message.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('columnSetVisibility_1');
        expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.None");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility_1.bottom - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_1.right - columnSetVisibility_1.left) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(vp2px(30))) <= 1)
          .assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(vp2px(120))) <= 1)
          .assertTrue()

      } catch (err) {
        console.error('[testColumnSetVisibilityNoneVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityNoneVisible END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2100
     * @tc.name testColumnSetVisibilityHiddenVisible
     * @tc.desc The subcomponents set visibility.hidden and visibility.visible.
     */
    it('testColumnSetVisibilityHiddenVisible', 0, async () => {
      console.info('new testColumnSetVisibilityHiddenVisible START');
      try {
        globalThis.value.message.notify({
          name: 'testVisibility1', value: Visibility.Hidden
        });
        globalThis.value.message.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('columnSetVisibility_1');
        expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.Hidden");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility.top - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility_1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(vp2px(40))) <= 1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityHiddenVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityHiddenVisible END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2200
     * @tc.name testColumnSetVisibilityVisible
     * @tc.desc The subcomponents both set visibility.visible.
     */
    it('testColumnSetVisibilityVisible', 0, async () => {
      console.info('new testColumnSetVisibilityVisible START');
      try {
        globalThis.value.message.notify({
          name: 'testVisibility1', value: Visibility.Visible
        });
        globalThis.value.message.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('columnSetVisibility_1');
        expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.Visible");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility.top - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility_1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(vp2px(40))) <= 1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisible END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2300
     * @tc.name testColumnSetVisibilityVisibleNone
     * @tc.desc The subcomponents set visibility.visible and visibility.none.
     */
    it('testColumnSetVisibilityVisibleNone', 0, async () => {
      console.info('new testColumnSetVisibilityVisibleNone START');
      try {
        globalThis.value.message.notify({
          name: 'testVisibility1', value: Visibility.Visible
        });
        globalThis.value.message.notify({
          name: 'testVisibility2', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('columnSetVisibility_2');
        expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.None");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility_2.bottom - columnSetVisibility_2.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.right - columnSetVisibility_2.left) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_1.top - columnSetVisibility.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_1.bottom - Math.round(vp2px(30))) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(vp2px(170))) <= 1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityVisibleNone] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisibleNone END');
    });
  })
}
