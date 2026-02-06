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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from '@ohos/hypium'
import router from '@ohos.router';
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
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import { UIContext } from '@ohos.arkui.UIContext';
export default function APIgetFrameNodeByUniqueId() {
  describe('APIgetFrameNodeByUniqueId', () => {
    beforeEach(async (done: Function) => {
      console.info("APIgetFrameNodeByUniqueIdTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MeasureSize/APIgetFrameNodeByUniqueId',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIgetFrameNodeByUniqueId state pages: " + JSON.stringify(pages));
        if (!("APIgetFrameNodeByUniqueId" == pages.name)) {
          console.info("get APIgetFrameNodeByUniqueId pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APIgetFrameNodeByUniqueId page error: " + err);
      }
      await CommonFunc.sleep(1000)
      console.info("APIgetFrameNodeByUniqueId beforeEach end");
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIgetFrameNodeByUniqueId after each called");
    })
    /**
     * @tc.name   APIgetFrameNodeByUniqueId_0100
     * @tc.number api
     * @tc.desc   APIgetFrameNodeByUniqueId_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIgetFrameNodeByUniqueId_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIgetFrameNodeByUniqueId_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIgetFrameNodeByUniqueId_Text01');
      console.info("[APIgetFrameNodeByUniqueId_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)), JSON.parse(strJson)
        .$attrs
        .content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('APIgetFrameNodeByUniqueId');
      console.info('[APIgetFrameNodeByUniqueId_0100] END');
      done();
    });
  })
}