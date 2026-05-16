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

export default function RenderNodeShadowAttributeTest() {
  describe('RenderNodeShadowAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RenderNodeShadowAttributeTest beforeAll start');
      await UtilsTest.msSleep(4000)
      await startAbility('com.arkui.ace.StateMangagement.api18.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('RenderNodeShadowAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNodeAttribute/RenderNodeShadowAttribute',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        if (!('RenderNodeShadowAttribute' == pages.name)) {
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RenderNodeShadowAttributeTest page error: ' + err);
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
     * @tc.number   RenderNodeShadowAttributeTest_static_0100
     * @tc.name     RenderNodeShadowAttributeTest_static_0100
     * @tc.desc     Verify shadowColor attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeShadowAttributeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeShadowAttributeTest_0100 START');
      await CommonFunc.sleep(1000);

      // 验证 shadowColor
      let strJson: string = inspector.getInspectorByKey('RenderNodeShadowAttribute_shadowColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeShadowAttributeTest_0100] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('shadowColor: -16711936');

      done();
      console.info('RenderNodeShadowAttributeTest_0100 END');
    })

    /**
     * @tc.number   RenderNodeShadowAttributeTest_static_0200
     * @tc.name     RenderNodeShadowAttributeTest_static_0200
     * @tc.desc     Verify shadowOffset attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeShadowAttributeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeShadowAttributeTest_0200 START');
      await CommonFunc.sleep(1000);

      // 验证 shadowOffset.x
      let strJson: string = inspector.getInspectorByKey('RenderNodeShadowAttribute_shadowOffset_x');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeShadowAttributeTest_0200] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('shadowOffset x: 10');

      // 验证 shadowOffset.y
      let strJson1: string = inspector.getInspectorByKey('RenderNodeShadowAttribute_shadowOffset_y');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[RenderNodeShadowAttributeTest_0200] component obj is: ' + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('shadowOffset y: 10');

      done();
      console.info('RenderNodeShadowAttributeTest_0200 END');
    })

    /**
     * @tc.number   RenderNodeShadowAttributeTest_static_0300
     * @tc.name     RenderNodeShadowAttributeTest_static_0300
     * @tc.desc     Verify shadowAlpha attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeShadowAttributeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeShadowAttributeTest_0300 START');
      await CommonFunc.sleep(1000);

      // 验证 shadowAlpha
      let strJson: string = inspector.getInspectorByKey('RenderNodeShadowAttribute_shadowAlpha');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeShadowAttributeTest_0300] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('shadowAlpha: 0.1');

      done();
      console.info('RenderNodeShadowAttributeTest_0300 END');
    })

    /**
     * @tc.number   RenderNodeShadowAttributeTest_static_0400
     * @tc.name     RenderNodeShadowAttributeTest_static_0400
     * @tc.desc     Verify shadowElevation attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeShadowAttributeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeShadowAttributeTest_0400 START');
      await CommonFunc.sleep(1000);

      // 验证 shadowElevation
      let strJson: string = inspector.getInspectorByKey('RenderNodeShadowAttribute_shadowElevation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeShadowAttributeTest_0400] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('shadowElevation: 10');

      done();
      console.info('RenderNodeShadowAttributeTest_0400 END');
    })

    /**
     * @tc.number   RenderNodeShadowAttributeTest_static_0500
     * @tc.name     RenderNodeShadowAttributeTest_static_0500
     * @tc.desc     Verify shadowRadius attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeShadowAttributeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeShadowAttributeTest_0500 START');
      await CommonFunc.sleep(1000);

      // 验证 shadowRadius
      let strJson: string = inspector.getInspectorByKey('RenderNodeShadowAttribute_shadowRadius');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeShadowAttributeTest_0500] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('shadowRadius: 5');

      done();
      console.info('RenderNodeShadowAttributeTest_0500 END');
    })
  })
}