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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'

export default function copyOptionJsunit() {
  describe('copyOptionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/copyOption',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get copyOption state success " + JSON.stringify(pages));
        if (!("copyOption" == pages.name)) {
          console.info("get copyOption state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push copyOption page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push copyOption page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("copyOption after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcopyOption0001
     * @tc.desic         acecopyOptionEtsTest0001
     */
    it('testcopyOption0001', 0, async (done: Function) => {
      console.info('hoverEffect testcopyOption0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('InAppText');
      console.info("[testcopyOption0001] component copyOption strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testcopyOption0001] copyOption value :" + JSON.parse(strJson).$attrs.copyOption);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcopyOption0002
     * @tc.desic         acecopyOptionEtsTest0002
     */
    it('testcopyOption0002', 0, async (done: Function) => {
      console.info('hoverEffect testcopyOption0002 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('LocalDeviceText');
      console.info("[testcopyOption0002] component copyOption strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testcopyOption0002] copyOption value :" + JSON.parse(strJson).$attrs.copyOption);
      done();
    });
  })
}