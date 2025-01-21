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
import router from '@system.router';
import CommonFunc from "../../../../MainAbility/common/Common";
import { MessageManager,Callback } from '../../../../MainAbility/common/MessageManager';
export default function flexHeightModify_StartJsunit() {
  describe('flexItemAlignStartTest6', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/FlexHeightModify',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexHeightModify state success " + JSON.stringify(pages));
        if (!("FlexHeightModify" == pages.name)) {
          console.info("get FlexHeightModify state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexHeightModify page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexHeightModify page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexHeightModify after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_START_0800
     * @tc.name      testFlexItemAlignStartDefaultSize
     * @tc.desc      Check the the default height of the first subcomponent.
     */
    it('testFlexItemAlignStartDefaultSize', 0, async function (done) {
      console.info('new testFlexItemAlignStartDefaultSize START');
      let strJson1 = getInspectorByKey('flexHeightModify');
      let obj1 = JSON.parse(strJson1);
      let textHeightModify01 = CommonFunc.getComponentRect('textHeightModify01');
      let textHeightModify02 = CommonFunc.getComponentRect('textHeightModify02');
      let textHeightModify03 = CommonFunc.getComponentRect('textHeightModify03');
      let flexHeightModify = CommonFunc.getComponentRect('flexHeightModify');

      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue()
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartDefaultSize END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_START_0900
     * @tc.name      testFlexItemAlignStartHeightModify
     * @tc.desc      Modify the first subcomponent's height.
     */
    it('testFlexItemAlignStartHeightModify', 0, async function (done) {
      console.info('new testFlexItemAlignStartHeightModify START');
      globalThis.value.message.notify({name:'height', value:80});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexHeightModify');
      let obj1 = JSON.parse(strJson1);
      let textHeightModify01 = CommonFunc.getComponentRect('textHeightModify01');
      let textHeightModify02 = CommonFunc.getComponentRect('textHeightModify02');
      let textHeightModify03 = CommonFunc.getComponentRect('textHeightModify03');
      let flexHeightModify = CommonFunc.getComponentRect('flexHeightModify');

      expect(Math.abs(textHeightModify01.top - textHeightModify02.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(80)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue()
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartHeightModify END');
      done();
    });
  })
}
