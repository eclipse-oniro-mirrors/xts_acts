/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { LayoutSafeAreaEdge } from '@kit.ArkUI';

export default function OffCanvasWidthHeightTest() {
  describe('OffCanvasWidthHeightTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("OffCanvasWidthHeightTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("OffCanvasWidthHeight beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/CanvasRenderingContext2D/OffCanvasWidthHeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get OffCanvasWidthHeight state pages:" + JSON.stringify(pages));
        if (!("OffCanvasWidthHeight" == pages.name)) {
          console.info("get OffCanvasWidthHeight pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OffCanvasWidthHeight page error:" + err);
      }
      console.info("OffCanvasWidthHeight beforeEach end");
    }); 

    /**
    * @tc.name   OffCanvasWidthHeightTest_0010
    * @tc.number SUB_ACE_OffCanvasWidthHeightTest_0010
    * @tc.desc   ArkUI Api
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('OffCanvasWidthHeightTest_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
    console.info('[OffCanvasWidthHeightTest_0010] START');
    await CommonFunc.sleep(1000);

    let strJson = inspector.getInspectorByKey('OffCanvasWidthHeight');
    let obj = JSON.parseJsonElement(strJson);

    console.info("[OffCanvasWidthHeightTest_0010] type is: " + JSON.stringify(obj.getString('$type')));
    console.info('get result:' + AppStorage.get<double>('OffCanvasWidth'));
    console.info('get result1:' + AppStorage.get<double>('OffCanvasHeight'));
    
    expect(obj.getString('$type')).assertEqual('Canvas');
    expect(AppStorage.get<double>('OffCanvasWidth')).assertEqual(200);
    expect(AppStorage.get<double>('OffCanvasHeight')).assertEqual(200);

    console.info('get LayoutSafeAreaEdge:' + LayoutSafeAreaEdge.START);
    console.info('get LayoutSafeAreaEdge:' + LayoutSafeAreaEdge.END);
    console.info('get LayoutSafeAreaEdge:' + LayoutSafeAreaEdge.VERTICAL);
    console.info('get LayoutSafeAreaEdge:' + LayoutSafeAreaEdge.HORIZONTAL);
    console.info('get LayoutSafeAreaEdge:' + LayoutSafeAreaEdge.ALL);

    expect(LayoutSafeAreaEdge.START).assertEqual(2);
    expect(LayoutSafeAreaEdge.END).assertEqual(3);
    expect(LayoutSafeAreaEdge.VERTICAL).assertEqual(4);
    expect(LayoutSafeAreaEdge.HORIZONTAL).assertEqual(5);
    expect(LayoutSafeAreaEdge.ALL).assertEqual(6);

    console.info('[OffCanvasWidthHeightTest_0010] END');
    done();
    });
    
  })
}

