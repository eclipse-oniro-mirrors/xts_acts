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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import { Constants } from './Constants';
import router from '@ohos.router';
import Utils from './Utils';

export default function webRegisterJavaScriptProxyTest() {

  describe('WebRegisterJavaScriptProxyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebRegisterJavaScriptProxyTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebRegisterJavaScriptProxyTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebRegisterJavaScriptProxyTest state success " + JSON.stringify(pages));
        if (!("WebRegisterJavaScriptProxyTest" == pages.name)) {
          console.info("get WebRegisterJavaScriptProxyTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebRegisterJavaScriptProxyTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebRegisterJavaScriptProxyTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebRegisterJavaScriptProxyTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebRegisterJavaScriptProxyTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_REGISTERJAVASCRIPTPROXY_0100
    * @tc.name        : testWebRegisterJavaScriptProxy001
    * @tc.desc        : stress testing registerJavaScriptProxy
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebRegisterJavaScriptProxy001', 0, async (done: Function) => {
      Utils.doIt("testWebRegisterJavaScriptProxy001", 82105, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_REGISTER_JAVASCRIPT_PROXY_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
