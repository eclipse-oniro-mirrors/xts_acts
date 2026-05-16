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

export default function RenderNodeAttributeTest() {
  describe('RenderNodeAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RenderNodeAttributeTest beforeAll start');
      await UtilsTest.msSleep(4000)
      await startAbility('com.arkui.ace.StateMangagement.api18.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('RenderNodeAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNodeAttribute/RenderNodeAttribute',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        if (!('RenderNodeAttribute' == pages.name)) {
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RenderNodeAttributeTest page error: ' + err);
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
     * @tc.number   RenderNodeAttributeTest_static_0100
     * @tc.name     RenderNodeAttributeTest_static_0100
     * @tc.desc     Verify backgroundColor attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeAttributeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeAttributeTest_0100 START');
      await CommonFunc.sleep(1000);

      // 验证 backgroundColor
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_backgroundColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeAttributeTest_0100] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('backgroundColor: -16711936');

      done();
      console.info('RenderNodeAttributeTest_0100 END');
    })

    /**
     * @tc.number   RenderNodeAttributeTest_static_0200
     * @tc.name     RenderNodeAttributeTest_static_0200
     * @tc.desc     Verify clipToFrame attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeAttributeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeAttributeTest_0200 START');
      await CommonFunc.sleep(1000);

      // 验证 clipToFrame
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_clipToFrame');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeAttributeTest_0200] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('clipToFrame: true');

      done();
      console.info('RenderNodeAttributeTest_0200 END');
    })

    /**
     * @tc.number   RenderNodeAttributeTest_static_0300
     * @tc.name     RenderNodeAttributeTest_static_0300
     * @tc.desc     Verify opacity attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeAttributeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeAttributeTest_0300 START');
      await CommonFunc.sleep(1000);

      // 验证 opacity
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_opacity');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeAttributeTest_0300] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('opacity: 0.5');

      done();
      console.info('RenderNodeAttributeTest_0300 END');
    })

    /**
     * @tc.number   RenderNodeAttributeTest_static_0400
     * @tc.name     RenderNodeAttributeTest_static_0400
     * @tc.desc     Verify size attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeAttributeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeAttributeTest_0400 START');
      await CommonFunc.sleep(1000);

      // 验证 size.width
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_size_width');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeAttributeTest_0400] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('size width: 20');

      // 验证 size.height
      let strJson1: string = inspector.getInspectorByKey('RenderNodeAttribute_size_height');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeAttributeTest_0400] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('size height: 20');

      done();
      console.info('RenderNodeAttributeTest_0400 END');
    })

    /**
     * @tc.number   RenderNodeAttributeTest_static_0500
     * @tc.name     RenderNodeAttributeTest_static_0500
     * @tc.desc     Verify position attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeAttributeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeAttributeTest_0500 START');
      await CommonFunc.sleep(1000);

      // 验证 position.x
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_position_x');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeAttributeTest_0500] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('position x: 10');

      // 验证 position.y
      let strJson1: string = inspector.getInspectorByKey('RenderNodeAttribute_position_y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeAttributeTest_0500] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('position y: 10');

      done();
      console.info('RenderNodeAttributeTest_0500 END');
    })

    /**
     * @tc.number   RenderNodeAttributeTest_static_0600
     * @tc.name     RenderNodeAttributeTest_static_0600
     * @tc.desc     Verify frame attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeAttributeTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeAttributeTest_0600 START');
      await CommonFunc.sleep(1000);

      // 验证 frame.x
      let strJson: string = inspector.getInspectorByKey('RenderNodeAttribute_frame_x');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeAttributeTest_0600] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('frame x: 10');

      // 验证 frame.y
      let strJson1: string = inspector.getInspectorByKey('RenderNodeAttribute_frame_y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeAttributeTest_0600] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('frame y: 10');

      // 验证 frame.width
      let strJson2: string = inspector.getInspectorByKey('RenderNodeAttribute_frame_width');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[RenderNodeAttributeTest_0600] component obj is: ' + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('frame w: 20');

      // 验证 frame.height
      let strJson3: string = inspector.getInspectorByKey('RenderNodeAttribute_frame_height');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[RenderNodeAttributeTest_0600] component obj is: ' + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('frame h: 20');

      done();
      console.info('RenderNodeAttributeTest_0600 END');
    })
  })
}