/**
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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../MainAbility/common/Utils';
import { BusinessError } from '@ohos.base';

;

export default function videoJsunit2() {
  describe('videoTest', () => {
    beforeEach(async (done: Function) => {
      console.info("video beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/video2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get video state pages:" + JSON.stringify(pages));
        if (!("video" == pages.name)) {
          console.info("get video state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push video page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push video page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("video after each called");
    });

    /**
     * @tc.name   testVideo01
     * @tc.number SUB_ARKUI_API_testVideo01
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVideo01', Level.LEVEL1, async (done: Function) => {
      console.info('[testVideo01] START');
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('VideoJsunitTwo');
      expect(JSON.parse(strJsonNew).$type).assertEqual('Video');
      console.info('[testVideo01] END');
      done();
    });

  });
}
