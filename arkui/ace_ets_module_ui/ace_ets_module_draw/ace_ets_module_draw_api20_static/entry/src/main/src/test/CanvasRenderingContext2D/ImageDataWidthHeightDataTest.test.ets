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
export default function ImageDataWidthHeightDataTest() {
  describe('ImageDataWidthHeightDataTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageDataWidthHeightDataTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageDataWidthHeightData beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/CanvasRenderingContext2D/ImageDataWidthHeightData',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ImageDataWidthHeightData state pages:" + JSON.stringify(pages));
        if (!("ImageDataWidthHeightData" == pages.name)) {
          console.info("get ImageDataWidthHeightData pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ImageDataWidthHeightData page error:" + err);
      }
      console.info("ImageDataWidthHeightData beforeEach end");
    }); 

    /**
    * @tc.name   ImageDataWidthHeightDataTest_0010
    * @tc.number SUB_ACE_ImageDataWidthHeightDataTest_0010
    * @tc.desc   ArkUI Api
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('ImageDataWidthHeightDataTest_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
    console.info('[ImageDataWidthHeightDataTest_0010] START');
    await CommonFunc.sleep(1000);

    let strJson = inspector.getInspectorByKey('ImageDataWidthHeightData');
    let obj = JSON.parseJsonElement(strJson);

    console.info("[ImageDataWidthHeightDataTest_0010] type is: " + JSON.stringify(obj.getString('$type')));
    console.info('get result:' + AppStorage.get<int>('ImageDataWidth'));
    console.info('get result1:' + AppStorage.get<int>('ImageDataHeight'));
    console.info('get result1:' + AppStorage.get<Uint8ClampedArray | undefined>('ImageDataData'));

    expect(obj.getString('$type')).assertEqual('Canvas');
    expect(AppStorage.get<int>('ImageDataWidth')).assertEqual(150);
    expect(AppStorage.get<int>('ImageDataHeight')).assertEqual(100);

    console.info('[ImageDataWidthHeightDataTest_0010] END');
    done();
    });
    
  })
}

