'use static'

/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function SegmentButtonV2Test0020Test() {
  describe('SegmentButtonV2Test0020Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SegmentButtonV2Test0020Test beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.component.nowear.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonV2Test0020Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/SegmentButtonV20020",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SegmentButtonV2Test0020Test state pages:" + JSON.stringify(pages));
        if (!("SegmentButtonV20020" == pages.name)) {
          console.info("get SegmentButtonV2Test0020Test pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SegmentButtonV2Test0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonV2Test0020Test page error:" + err);
      }
      console.info("SegmentButtonV2Test0020Test beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonV2Test0020Test after each called");
    });




    /**
     * @tc.number   SegmentButtonV2Test0020_static_001
     * @tc.name     SegmentButtonV2Test0020_static_001
     * @tc.desc     SegmentButtonV2Test0020_static_001
     * @tc.level    Level.LEVEL0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     */
    it('SegmentButtonV2Test0020_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonV2Test0020_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick = await driver.findComponent(ON.id("isHybrid"));
      await CommonFunc.sleep(500);
      await (textClick?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('isHybrid'));
      console.info("[SegmentButtonV2Test0020_static_001] select index is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      await CommonFunc.sleep(500);
      let textClick1 = await driver.findComponent(ON.id("hasHybrid"));
      await CommonFunc.sleep(500);
      await (textClick1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('hasHybrid'));
      console.info("[SegmentButtonV2Test0020_static_001] select index is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('true');
      await CommonFunc.sleep(500);
      console.info('[SegmentButtonV2Test0020_static_001] END');
      done();
    });
  })
}