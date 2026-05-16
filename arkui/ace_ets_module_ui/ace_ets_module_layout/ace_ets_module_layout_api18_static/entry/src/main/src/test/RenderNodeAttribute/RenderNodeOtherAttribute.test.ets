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

export default function RenderNodeOtherAttributeTest() {
  describe('RenderNodeOtherAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RenderNodeOtherAttributeTest beforeAll start');
      await UtilsTest.msSleep(4000)
      await startAbility('com.arkui.ace.StateMangagement.api18.static', 'EntryAbility')
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('RenderNodeOtherAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNodeAttribute/RenderNodeOtherAttribute',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        if (!('RenderNodeOtherAttribute' == pages.name)) {
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RenderNodeOtherAttributeTest page error: ' + err);
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
     * @tc.number   RenderNodeOtherAttributeTest_static_0100
     * @tc.name     RenderNodeOtherAttributeTest_static_0100
     * @tc.desc     Verify shapeMask attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeOtherAttributeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeOtherAttributeTest_0100 START');
      await CommonFunc.sleep(1000);

      // 验证 shapeMask isMaskOut
      let strJson: string = inspector.getInspectorByKey('RenderNodeOtherAttribute_shapeMask');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeOtherAttributeTest_0100] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('shapeMask: 24');

      done();
      console.info('RenderNodeOtherAttributeTest_0100 END');
    })

    /**
     * @tc.number   RenderNodeOtherAttributeTest_static_0200
     * @tc.name     RenderNodeOtherAttributeTest_static_0200
     * @tc.desc     Verify shapeClip attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeOtherAttributeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeOtherAttributeTest_0200 START');
      await CommonFunc.sleep(1000);

      // 验证 shapeClip id
      let strJson: string = inspector.getInspectorByKey('RenderNodeOtherAttribute_shapeClip');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeOtherAttributeTest_0200] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).not().assertUndefined();

      done();
      console.info('RenderNodeOtherAttributeTest_0200 END');
    })

    /**
     * @tc.number   RenderNodeOtherAttributeTest_static_0300
     * @tc.name     RenderNodeOtherAttributeTest_static_0300
     * @tc.desc     Verify markNodeGroup attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeOtherAttributeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeOtherAttributeTest_0300 START');
      await CommonFunc.sleep(1000);

      // 验证 markNodeGroup
      let strJson: string = inspector.getInspectorByKey('RenderNodeOtherAttribute_markNodeGroup');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeOtherAttributeTest_0300] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('markNodeGroup: true');

      done();
      console.info('RenderNodeOtherAttributeTest_0300 END');
    })

    /**
     * @tc.number   RenderNodeOtherAttributeTest_static_0400
     * @tc.name     RenderNodeOtherAttributeTest_static_0400
     * @tc.desc     Verify lengthMetricsUnit attribute can be set and retrieved correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    Level.LEVEL0
     */
    it('RenderNodeOtherAttributeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RenderNodeOtherAttributeTest_0400 START');
      await CommonFunc.sleep(1000);

      // 验证 lengthMetricsUnit
      let strJson: string = inspector.getInspectorByKey('RenderNodeOtherAttribute_lengthMetricsUnit');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RenderNodeOtherAttributeTest_0400] component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('lengthMetricsUnit: 0');

      done();
      console.info('RenderNodeOtherAttributeTest_0400 END');
    })
  })
}