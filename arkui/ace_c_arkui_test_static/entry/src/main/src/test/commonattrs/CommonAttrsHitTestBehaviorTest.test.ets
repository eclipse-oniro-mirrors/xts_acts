'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level } from '../../../../hypium';
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function commonAttrsHitTestBehaviorTest() {

  describe('CommonAttrsHitTestBehaviorTest', () => {

    let PAGE_TAG = 'CommonAttrsHitTestBehaviorTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`commonattrs/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCommonAttrsHitTestBehavior001
     * @tc.name     testCommonAttrsHitTestBehavior001
     * @tc.desc     testCommonAttrsHitTestBehavior001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsHitTestBehavior001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnTouchTestStackDefault')
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('OnTouchTestCommonAttrsDefault');
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('OnTouchTestCommonAttrsBrotherDefault');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj2.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackBlock')
      await Utils.sleep(1000)
      let strJson3 = inspector.getInspectorByKey('OnTouchTestCommonAttrsBlock');
      let obj3 = JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('OnTouchTestCommonAttrsBrotherBlock');
      let obj4 = JSON.parseJsonElement(strJson4);
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      expect(obj4.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackTransparent')
      await Utils.sleep(1000)
      let strJson5 = inspector.getInspectorByKey('OnTouchTestCommonAttrsTransparent');
      let obj5 = JSON.parseJsonElement(strJson5);
      let strJson6 = inspector.getInspectorByKey('OnTouchTestCommonAttrsBrotherTransparent');
      let obj6 = JSON.parseJsonElement(strJson6);
      expect(obj5.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')
      expect(obj6.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackNone')
      await Utils.sleep(1000)
      let strJson7 = inspector.getInspectorByKey('OnTouchTestCommonAttrsNone');
      let obj7 = JSON.parseJsonElement(strJson7);
      let strJson8 = inspector.getInspectorByKey('OnTouchTestCommonAttrsBrotherNone');
      let obj8 = JSON.parseJsonElement(strJson8);
      expect(obj7.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF0000FF')
      expect(obj8.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF00FF00')

      await Utils.clickComponent('OnTouchTestStackExceptBelow')
      await Utils.sleep(1000)
      let strJson9 = inspector.getInspectorByKey('OnTouchTestCommonAttrsExceptBelow');
      let obj9 = JSON.parseJsonElement(strJson9);
      let strJson10 = inspector.getInspectorByKey('OnTouchTestCommonAttrsBrotherExceptBelow');
      let obj10 = JSON.parseJsonElement(strJson10);
      expect(obj9.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF0000')
      expect(obj10.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackExceptAbove')
      await Utils.sleep(1000)
      let strJson11 = inspector.getInspectorByKey('OnTouchTestCommonAttrsExceptAbove');
      let obj11 = JSON.parseJsonElement(strJson11);
      let strJson12 = inspector.getInspectorByKey('OnTouchTestCommonAttrsBrotherExceptAbove');
      let obj12 = JSON.parseJsonElement(strJson12);
      expect(obj11.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FFFF0000')
      expect(obj12.getElement('$attrs').getString('backgroundColor'))
        .assertEqual('#FF000000')

      done()
    })

  })
}