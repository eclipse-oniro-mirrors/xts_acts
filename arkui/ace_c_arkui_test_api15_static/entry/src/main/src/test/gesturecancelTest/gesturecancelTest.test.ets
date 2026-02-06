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

import { expect, describe, it, afterEach, beforeEach, Level, beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { TouchEventData } from '../../../ets/pages/gestureCancel/TouchEventData'
let libUtil:LibUtil = new LibUtil();

export default function gesturecancelTest() {

  describe('gesturecancelTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("gesturecancelTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gestureCancel/gestureCancel',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureCancel state pages:" + JSON.stringify(pages));
        if (!("gestureCancel" == pages.name)) {
          console.info("get gestureCancel pages.name:" + JSON.stringify(pages.name));
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error("push gestureCancel page error:" + err);
      }
      console.info("gestureCancel beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testGestureCancelTest001
     * @tc.name     testGestureCancelTest001
     * @tc.desc     testGestureCancelTest001
     * @tc.level    Level.LEVEL1
     */
    it('testGestureCancelTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await Utils.sleep(500);
      // inner list scroll
      let strJson = inspector.getInspectorByKey("inner");  //可能是inspector.getInspectorByKey返回值有问题
      let rect = JSON.parseJsonElement(strJson);
      let context: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
      let x = Math.round(AppStorage.get<number>('winLeft') as  number + Utils.getRectHorizontalCenterX(Utils.getComponentRectByObj(rect)));
      // the visual list height is vp2px(200)
      let y = Math.round(AppStorage.get<number>('winTop') as number + Utils.getComponentRectByObj(rect).top + context.vp2px(100));
      console.info("testGestureCancelTest001  x= " +  x  + ", y = " + y);
      driver.swipe(x.toInt(), y.toInt(), x.toInt(), Math.round(y - context.vp2px(200)).toInt());
      await Utils.sleep(2000);
       // test the callbackData;
      let object1:TouchEventData = libUtil.GetTouchEventData();
      console.info("testGestureCancelTest00_" + object1.scrollCount);
      console.info("testGestureCancelTest00_" + object1.columnCount);

      expect(object1.scrollCount >= object1.columnCount).assertTrue();
      done();

    });

  })
}
