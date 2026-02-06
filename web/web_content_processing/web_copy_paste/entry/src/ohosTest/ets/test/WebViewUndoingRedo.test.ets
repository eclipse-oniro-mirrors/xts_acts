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
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""


export default function ActswebviewUndoingRedo() {
  describe('ActswebviewUndoingRedoTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewUndoingRedo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webviewUndoingRedo state success " + JSON.stringify(pages));
        if (!("WebViewUndoingRedo" == pages.name)) {
          console.info("get webviewUndoingRedo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webviewUndoingRedo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webviewUndoingRedo page error: " + err);
      }
      await waitForComponent("webviewUndoingRedoButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 130700,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      done();
    })

    /**
     * @tc.name   testWebviewUndoingRedo
     * @tc.number SUB_ACE_WEBVIEWUNDOINGREDO_API_0001
     * @tc.desc   testWebviewUndoingRedo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewUndoingRedo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebviewUndoingRedo";
      Utils.emitEvent(emitKey, 130700);
      Utils.registerEvent("testWebviewUndoingRedo", true, 130710, done);
      sendEventByKey('webviewUndoingRedoButton', 10, '');
    })

    /**
     * @tc.name   testWebviewUndoingRedo002
     * @tc.number SUB_ACE_WEBVIEWUNDOINGREDO_API_0002
     * @tc.desc   testWebviewUndoingRedo002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewUndoingRedo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebviewUndoingRedo002";
      Utils.emitEvent(emitKey, 130700);
      Utils.registerEvent("testWebviewUndoingRedo002", true, 130720, done);
      sendEventByKey('webviewUndoingRedoButton', 10, '');
    })

  })
}
