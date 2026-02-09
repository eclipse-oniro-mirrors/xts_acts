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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function dragPreviewJsSuit() {
  describe('dragPreviewJsSuit', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
done();
});
    beforeAll(async (done: Function) => {
      console.info("dragPreviewJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/dragPreview',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dragPreviewJsSuit state pages: " + JSON.stringify(pages));
        if (!("overlay" == pages.name)) {
          console.info("get dragPreviewJsSuit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dragPreviewJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragPreviewJsSuit page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });


    /**
     * @tc.name   dragPreviewJsSuit_0100
     * @tc.number dragPreviewJsSuit_0100
     * @tc.desc   dragPreviewJsSuit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewJsSuit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[dragPreviewJsSuit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imagepreview');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewJsSuit_0100] obj is: " + JSON.stringify(obj.$attrs.content));
      console.info("[dragPreviewJsSuit_0100] obj is: " + JSON.stringify(obj.$attrs.width));
      console.info("[dragPreviewJsSuit_0100] obj is: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.width=='30.00%').assertTrue();
      expect(obj.$attrs.height=='100.00vp').assertTrue();
      console.info('[dragPreviewJsSuit_0100] END');
      done();
    });
  })
}