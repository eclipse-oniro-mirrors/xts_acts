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

export default function RenderNodeBorderAttributeTest() {
  describe('RenderNodeBorderAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RenderNodeBorderAttributeTest beforeAll start');
      await UtilsTest.msSleep(4000)
      await startAbility('com.arkui.ace.StateMangagement.api18.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('RenderNodeBorderAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNodeAttribute/RenderNodeBorderAttribute',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        if (!('RenderNodeBorderAttribute' == pages.name)) {
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RenderNodeBorderAttributeTest page error: ' + err);
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
     * @tc.number   RenderNodeBorderAttributeTest_static_0100
     * @tc.name     RenderNodeBorderAttributeTest_static_0100
     * @tc.desc     Verify borderStyle attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeBorderAttributeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeBorderAttributeTest_0100 START');
      await CommonFunc.sleep(1000);

      // 验证 borderStyle top
      let strJson: string = inspector.getInspectorByKey('RenderNodeBorderAttribute_borderStyle_top');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeBorderAttributeTest_0100] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('borderStyle top: 2');

      done();
      console.info('RenderNodeBorderAttributeTest_0100 END');
    })

    /**
     * @tc.number   RenderNodeBorderAttributeTest_static_0200
     * @tc.name     RenderNodeBorderAttributeTest_static_0200
     * @tc.desc     Verify borderWidth attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeBorderAttributeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeBorderAttributeTest_0200 START');
      await CommonFunc.sleep(1000);

      // 验证 borderWidth top
      let strJson: string = inspector.getInspectorByKey('RenderNodeBorderAttribute_borderWidth_top');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeBorderAttributeTest_0200] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('borderWidth top: 5');

      done();
      console.info('RenderNodeBorderAttributeTest_0200 END');
    })

    /**
     * @tc.number   RenderNodeBorderAttributeTest_static_0300
     * @tc.name     RenderNodeBorderAttributeTest_static_0300
     * @tc.desc     Verify borderColor attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeBorderAttributeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeBorderAttributeTest_0300 START');
      await CommonFunc.sleep(1000);

      // 验证 borderColor top
      let strJson: string = inspector.getInspectorByKey('RenderNodeBorderAttribute_borderColor_top');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeBorderAttributeTest_0300] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('borderColor top: -16711936');

      done();
      console.info('RenderNodeBorderAttributeTest_0300 END');
    })

    /**
     * @tc.number   RenderNodeBorderAttributeTest_static_0400
     * @tc.name     RenderNodeBorderAttributeTest_static_0400
     * @tc.desc     Verify borderRadius attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeBorderAttributeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeBorderAttributeTest_0400 START');
      await CommonFunc.sleep(1000);

      // 验证 borderRadius.topLeft
      let strJson: string = inspector.getInspectorByKey('RenderNodeBorderAttribute_borderRadius_topLeft');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeBorderAttributeTest_0400] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('borderRadius topLeft: 10');

      done();
      console.info('RenderNodeBorderAttributeTest_0400 END');
    })

    /**
     * @tc.number   RenderNodeBorderAttributeTest_static_0500
     * @tc.name     RenderNodeBorderAttributeTest_static_0500
     * @tc.desc     Verify label attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeBorderAttributeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeBorderAttributeTest_0500 START');
      await CommonFunc.sleep(1000);

      // 验证 label
      let strJson: string = inspector.getInspectorByKey('RenderNodeBorderAttribute_label');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeBorderAttributeTest_0500] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('label: testLabel');

      done();
      console.info('RenderNodeBorderAttributeTest_0500 END');
    })
  })
}