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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import { UIContext } from '@ohos.arkui.UIContext';
class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        return;
      }
      windowStage.getMainWindow((err, data) => {
        if (err.code) {
          return;
        }
        let windowClass: window.Window = data;
        let uiContext: UIContext = windowClass.getUIContext();
        uiContext.getDragController().setDragEventStrictReportingEnabled(true);
        uiContext.getFilteredInspectorTree(['id', 'src', 'content']);
        uiContext.getFilteredInspectorTreeById('testId', 0, ['id', 'src', 'content']);
        uiContext.getComponentSnapshot();
      });
    });
  }
}
export default function APIsetDragEventStrictReportingEnabled() {
  describe('APIsetDragEventStrictReportingEnabled', () => {
    beforeEach(async (done: Function) => {
      console.info("APIsetDragEventStrictReportingEnabledTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MeasureSize/APIsetDragEventStrictReportingEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIsetDragEventStrictReportingEnabled state pages: " + JSON.stringify(pages));
        if (!("APIsetDragEventStrictReportingEnabled" == pages.name)) {
          console.info("get APIsetDragEventStrictReportingEnabled pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APIsetDragEventStrictReportingEnabled page error: " + err);
      }
      await CommonFunc.sleep(1000)
      console.info("APIsetDragEventStrictReportingEnabled beforeEach end");
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIsetDragEventStrictReportingEnabled after each called");
    })
    /**
     * @tc.number api
     * @tc.name APIsetDragEventStrictReportingEnabled_0100
     * @tc.desc APIsetDragEventStrictReportingEnabled_0100
     * @tc.size APIsetDragEventStrictReportingEnabled
     * @tc.type UIContext
     * @tc.level 2
     */
    it('APIsetDragEventStrictReportingEnabled_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIsetDragEventStrictReportingEnabled_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIsetDragEventStrictReportingEnabled_Text01');
      console.info("[APIsetDragEventStrictReportingEnabled_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)), JSON.parse(strJson)
        .$attrs
        .content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('APIsetDragEventStrictReportingEnabled');
      console.info('[APIsetDragEventStrictReportingEnabled_0100] END');
      done();
    });
  })
}