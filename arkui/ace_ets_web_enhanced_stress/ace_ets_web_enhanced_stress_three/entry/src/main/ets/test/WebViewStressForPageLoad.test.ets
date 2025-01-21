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
import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Constants } from './Constants'

export default function webViewStressForPageLoad() {

  describe('WebViewStressForPageLoad', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewStressForPageLoad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewStressForPageLoad state success " + JSON.stringify(pages));
        if (!("WebViewStressForPageLoad" == pages.name)) {
          console.info("get WebViewStressForPageLoad state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewStressForPageLoad page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewStressForPageLoad page error: " + err);
      }
      done()
    })

    afterEach(async (done: Function) => {
      console.info("WebViewStressForPageLoad afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewStressForPageLoad afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_PREPAREFORPAGELOAD_0100
    * @tc.name       : testPrepareForPageLoad001
    * @tc.desc       : test PrepareForPageLoadErr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrepareForPageLoad001', 0, async (done: Function) => {
      Utils.doIt("testPrepareForPageLoad001", 1511, Constants.DEFAULT_STRESS_TIMES,
        Constants.FOR_PAGE_LOAD_ERROR,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })
  })
}
