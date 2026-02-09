'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level, describe, beforeAll, beforeEach } from '../../../../hypium';
import { Component, Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import inspector from '@ohos.arkui.inspector'
import { UIContext, UIInspector, Context } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';



export default function ScrollSizeTest() {

  describe('ScrollSizeTest', (): void => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api14.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);

    })

    
    /**
     * @tc.number   testGetScrollSizeTest001
     * @tc.name     testGetScrollSizeTest001
     * @tc.desc     testGetScrollSizeTest001
     * @tc.level    Level.LEVEL1
     */
    it('testGetScrollSizeTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollSizeTest';
      await Utils.pushPage(`scrollSize/${PAGE_TAG}`);
      await Utils.sleep(1000)
      console.info("testGetScrollSizeTest001  START");
      let driver = Driver.create();
      let rect = Utils.getComponentRect("scrollSizeCalled");
      let x = Math.round(AppStorage.get<number>("winLeft") as number + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(AppStorage.get<number>("winTop") as number + Utils.getRectVerticalCenterY(rect));
      console.info("testGetScrollSizeTest001  x= " + x + ", y = " + y);
      await driver.swipe(x.toInt(), Math.round(y + AppStorage.get<UIContext>('uiContext')!.vp2px(40)).toInt(), x.toInt(),
        Math.round(y - AppStorage.get<UIContext>('uiContext')!.vp2px(40)).toInt());
      await Utils.sleep(2000);
      console.info("testGetScrollSizeTest001  swipe");
      expect(Utils.getComponentInfoByKey('scrollSizeCalled').getElement("$attrs").getString("backgroundColor"))
        .assertEqual('#FF00FF00')
      done();
    });

  })
}