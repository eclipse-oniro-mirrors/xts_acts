'use static';

/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Component, Driver, ON, MatchPattern, DisplayRotation } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';

export default function RenderNodeTransformAttributeTest() {
  describe('RenderNodeTransformAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RenderNodeTransformAttributeTest beforeAll start');
      await UtilsTest.msSleep(4000)
      await startAbility('com.arkui.ace.StateMangagement.api18.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('RenderNodeTransformAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNodeAttribute/RenderNodeTransformAttribute',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        if (!('RenderNodeTransformAttribute' == pages.name)) {
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RenderNodeTransformAttributeTest page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.number   RenderNodeTransformAttributeTest_static_0100
     * @tc.name     RenderNodeTransformAttributeTest_static_0100
     * @tc.desc     Verify pivot attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeTransformAttributeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeTransformAttributeTest_0100 START');
      await CommonFunc.sleep(1000);

      // 验证 pivot.x
      let strJson: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_pivot_x');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeTransformAttributeTest_0100] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('pivot x: 0.5');

      // 验证 pivot.y
      let strJson1: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_pivot_y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeTransformAttributeTest_0100] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('pivot y: 0.6');

      done();
      console.info('RenderNodeTransformAttributeTest_0100 END');
    })

    /**
     * @tc.number   RenderNodeTransformAttributeTest_static_0200
     * @tc.name     RenderNodeTransformAttributeTest_static_0200
     * @tc.desc     Verify scale attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeTransformAttributeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeTransformAttributeTest_0200 START');
      await CommonFunc.sleep(1000);

      // 验证 scale.x
      let strJson: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_scale_x');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeTransformAttributeTest_0200] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('scale x: 0.5');

      // 验证 scale.y
      let strJson1: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_scale_y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeTransformAttributeTest_0200] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('scale y: 1');

      done();
      console.info('RenderNodeTransformAttributeTest_0200 END');
    })

    /**
     * @tc.number   RenderNodeTransformAttributeTest_static_0300
     * @tc.name     RenderNodeTransformAttributeTest_static_0300
     * @tc.desc     Verify translation attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeTransformAttributeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeTransformAttributeTest_0300 START');
      await CommonFunc.sleep(1000);

      // 验证 translation.x
      let strJson: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_translation_x');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeTransformAttributeTest_0300] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('translation x: 100');

      // 验证 translation.y
      let strJson1: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_translation_y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeTransformAttributeTest_0300] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('translation y: 0');

      done();
      console.info('RenderNodeTransformAttributeTest_0300 END');
    })

    /**
     * @tc.number   RenderNodeTransformAttributeTest_static_0400
     * @tc.name     RenderNodeTransformAttributeTest_static_0400
     * @tc.desc     Verify rotation attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeTransformAttributeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeTransformAttributeTest_0400 START');
      await CommonFunc.sleep(1000);

      // 验证 rotation.x
      let strJson: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_rotation_x');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeTransformAttributeTest_0400] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('rotation x: 45');

      // 验证 rotation.y
      let strJson1: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_rotation_y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeTransformAttributeTest_0400] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('rotation y: 0');

      // 验证 rotation.z
      let strJson2: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_rotation_z');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[RenderNodeTransformAttributeTest_0400] component obj is: ' + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('rotation z: 0');

      done();
      console.info('RenderNodeTransformAttributeTest_0400 END');
    })

    /**
     * @tc.number   RenderNodeTransformAttributeTest_static_0500
     * @tc.name     RenderNodeTransformAttributeTest_static_0500
     * @tc.desc     Verify transform attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeTransformAttributeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeTransformAttributeTest_0500 START');
      await CommonFunc.sleep(1000);

      // 验证 transform[0]
      let strJson: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_transform_0');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeTransformAttributeTest_0500] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('transform[0]: 1');

      // 验证 transform[5]
      let strJson1: string = inspector.getInspectorByKey('RenderNodeTransformAttribute_transform_5');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeTransformAttributeTest_0500] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('transform[5]: 2');

      done();
      console.info('RenderNodeTransformAttributeTest_0500 END');
    })
  })
}