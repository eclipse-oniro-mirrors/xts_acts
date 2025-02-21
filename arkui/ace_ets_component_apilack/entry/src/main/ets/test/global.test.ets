// @ts-nocheck
/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function globalJsunit() {
  describe('globalJsunit', function () {
    beforeEach(async function (done) {
      console.info("global beforeEach start");
      let options = {
        uri: 'pages/global',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get global state pages:" + JSON.stringify(pages));
        if (!("global" == pages.name)) {
          console.info("get global state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push global page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push global page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testglobal_getInspectorTree0001
     * @tc.desic         aceGlobal_getInspectorTree0001
     */
    it('testglobal_getInspectorTree0001', 0, async function (done) {
      console.info('testglobal_getInspectorTree0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorTree();
      console.info("[testglobal_getInspectorTree0001] strJson:" + strJson);
      expect(strJson !== null).assertTrue();
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testglobal_sendKeyEvent0002
     * @tc.desic         aceGlobal_sendKeyEvent0002
     */
    it('testglobal_sendKeyEvent0002', 0, async function (done) {
      console.info('testglobal_sendKeyEvent0002 START');
      await Utils.sleep(2000);
      let KeyEvent = {type:1,keyCode:2027,keyText:"Unknown",keySource:4,deviceId:7,metaKey:0,timestamp:5284417765376};
      let result = sendKeyEvent(KeyEvent);
      console.info("[testglobal_sendKeyEvent0002] result:" + result);
      expect(JSON.stringify(result)).assertEqual("true");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testglobal_sendMouseEvent0003
     * @tc.desic         aceGlobal_sendMouseEvent0003
     */
    it('testglobal_sendMouseEvent0003', 0, async function (done) {
      console.info('testglobal_sendMouseEvent0003 START');
      await Utils.sleep(2000);

      let mouseEvent: MouseEvent = {
            button: 0,
            action: 3,
            x: 34, 
            y: 34, 
            screenX: 202.66666666666666, 
            screenY: 102.66666666666667, 
            timestamp: 8261302454000,
            target: {
              area: {
                width: 142.66666666666666,
                height:58.666666666666664,
                position: {
                  x: 158.66666666666666,
                  y: 58.666666666666664,
                },
                globalPosition: {
                  x: 168.66666666666666,
                  y: 68.66666666666666,
                }
              }
            },
            source: 1
      }
      let result = sendMouseEvent(mouseEvent);
      console.info("[testglobal_sendMouseEvent0003] result:" + result);
      expect(JSON.stringify(result)).assertEqual("true");
      done();
    });
  })
}