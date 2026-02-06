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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/utils/Utils';
let emitKey = "emitUserAgent";

export default function navigationuxtest() {
  describe('navigationuxtest',  () =>{
    const SUITE: string = 'navigationuxtest'
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Navigation/navigationux",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("navigationux" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);

          })
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ArkUX_Stage_Navigation_0100
     * @tc.number ArkUX_Stage_Navigation_0100
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Navigation_0100',  Level.LEVEL0, async  (done:Function) =>{
      console.info('ArkUX_Stage_Navigation_0100 START');
      setTimeout(() => {
        try {
          let strJson: string = getInspectorByKey('ArkUX_Stage_Navigation_0100');
          console.info('ArkUX_Stage_Navigation_0100 START  :' + JSON.stringify(strJson));
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("ArkUX_Stage_Navigation_0100 component obj.$attrs.toolbarConfiguration is: " +
          JSON.stringify(obj.$attrs.toolbarConfiguration));
          console.info('ArkUX_Stage_Navigation_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Navigation_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });
  })
}
