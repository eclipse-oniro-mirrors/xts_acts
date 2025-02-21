/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';

export default function assemblyCallbackTest() {
  describe('assemblyCallbackTest', () => {

    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/assemblyCallback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get assemblyCallback state success " + JSON.stringify(pages));
        if (!("assemblyCallback" == pages.name)) {
          console.info("get assemblyCallback state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push assemblyCallback page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push assemblyCallback page error: " + err);
      }
      done()
    });

    it('ArkUX_Callback_notification_0210', 0, async (done: Function) => {
      console.info('ArkUX_Callback_notification_0210 START');
      setTimeout(() => {
        try {
          let listener11 = inspector.createComponentObserver("null")
          console.info('ArkUX_Callback_notification_0210 START  :' + listener11);
          console.info('ArkUX_Callback_notification_0210 START  :' + typeof listener11);
          expect(typeof listener11).assertEqual("object")
          console.info('ArkUX_Callback_notification_0210 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Callback_notification_0210 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Callback_notification_0220', 0, async (done: Function) => {
      console.info('ArkUX_Callback_notification_0220 START');
      setTimeout(() => {
        try {
          let listener12 = inspector.createComponentObserver("")
          console.info('ArkUX_Callback_notification_0220 START  :' + listener12);
          console.info('ArkUX_Callback_notification_0220 START  :' + typeof listener12);
          expect(typeof listener12).assertEqual("object")
          console.info('ArkUX_Callback_notification_0220 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Callback_notification_0220 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Callback_notification_0230', 0, async (done: Function) => {
      console.info('ArkUX_Callback_notification_0230 START');
      setTimeout(() => {
        try {
          let listener13 = inspector.createComponentObserver("object")
          console.info('ArkUX_Callback_notification_0230 START  :' + listener13);
          console.info('ArkUX_Callback_notification_0230 START  :' + typeof listener13);
          expect(typeof listener13).assertEqual("object")
          console.info('ArkUX_Callback_notification_0230 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Callback_notification_0230 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Callback_notification_0240', 0, async (done: Function) => {
      console.info('ArkUX_Callback_notification_0240 START');
      setTimeout(() => {
        try {
          let listener14 = inspector.createComponentObserver("null")
          console.info('ArkUX_Callback_notification_0240 START  :' + listener14);
          console.info('ArkUX_Callback_notification_0240 START  :' + typeof listener14);
          expect(typeof listener14).assertEqual("object")
          console.info('ArkUX_Callback_notification_0240 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Callback_notification_0240 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Callback_notification_0250', 0, async (done: Function) => {
      console.info('ArkUX_Callback_notification_0250 START');
      setTimeout(() => {
        try {
          let listener15 = inspector.createComponentObserver("")
          console.info('ArkUX_Callback_notification_0250 START  :' + listener15);
          console.info('ArkUX_Callback_notification_0250 START  :' + typeof listener15);
          expect(typeof listener15).assertEqual("object")
          console.info('ArkUX_Callback_notification_0250 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Callback_notification_0250 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Callback_notification_0260', 0, async (done: Function) => {
      console.info('ArkUX_Callback_notification_0260 START');
      setTimeout(() => {
        try {
          let listener16 = inspector.createComponentObserver("object")
          console.info('ArkUX_Callback_notification_0260 START  :' + listener16);
          console.info('ArkUX_Callback_notification_0260 START  :' + typeof listener16);
          expect(typeof listener16).assertEqual("object")
          console.info('ArkUX_Callback_notification_0260 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Callback_notification_0260 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}