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

import { describe, expect, it, afterEach, Level, beforeAll, beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton, Component, Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';


export default function refreshOnOffsetChangeTest() {

  describe('RefreshOnOffsetChangeTest', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    /*
     * @tc.number   testRefreshOnOffsetChange001
     * @tc.name     testRefreshOnOffsetChange001
     * @tc.desc     testRefreshOnOffsetChange001
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshOnOffsetChange001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let context: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
      let PAGE_TAG = 'RefreshOnOffsetChangeTest';
      await Utils.pushPage(`refresh/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create();
      let strJson1 = inspector.getInspectorByKey('RefreshOnOffsetChange');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rect = Utils.getComponentRectByObj(obj1);
      let x = (Math.round(AppStorage.get<number>('winLeft') as number + Utils.getRectHorizontalCenterX(rect))).toInt();
      let y = (Math.round(AppStorage.get<number>('winTop') as number + Utils.getRectVerticalCenterY(rect))).toInt();
      console.info("RefreshOnOffsetChangeTest  x= " + x + ", y = " + y);
      await driver.swipe((Math.round(x - context.vp2px(30))).toInt(), (Math.round(y - context.vp2px(100))).toInt(),
        (Math.round(x + context.vp2px(30))).toInt(), (Math.round(y + context.vp2px(500))).toInt());
      await Utils.sleep(2000);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFFF00');
      done();
    })
  })
}
