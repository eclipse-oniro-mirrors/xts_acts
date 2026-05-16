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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function previewOptions() {
  describe('previewOptions', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
done();
});
    beforeAll(async (done: Function) => {
      console.info("previewOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/touchPoint_Disable',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get previewOptions state pages: " + JSON.stringify(pages));
        if (!("previewOptions" == pages.name)) {
          console.info("get previewOptions state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push previewOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push previewOptions page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   previewOptions_0100
     * @tc.number SUB_ACE_previewOptions_0100
     * @tc.desc   previewOptions:{mode:	DragPreviewMode.DISABLE_SCALE} api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('previewOptions_0100', Level.LEVEL0, async (done: Function) => {
      console.info('previewOptions_0100 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('custom_id'));
      let text: Component = await driver.findComponent(ON.id('disable_id'));
      await button.dragTo(text);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('disable_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[previewOptions_0100] component obj is: " + JSON.stringify(obj));
      console.info("[previewOptions_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('{"mode":2}');
      console.info('[previewOptions_0100] END');
      done();
    });
  })
}

