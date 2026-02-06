/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function videoJsunit() {


  describe('VideoAppInfoTest', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video/Video',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Video state success " + JSON.stringify(pages));
        if (!("Video" == pages.name)) {
          console.info("get Video state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Video page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Video page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      console.info("Video after each called");
      await sleep(1)
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0630
     * @tc.name videoAppInfoTest001
     * @tc.desc aceEtsTest
     */
    it('videoAppInfoTest001', Level.LEVEL1, async () => {
      console.info('videoAppInfoTest001 START');
      await sleep(1)
      let strJson = getInspectorByKey('video');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("cd video component obj is: " + JSON.stringify(obj));
      console.log("cd video type" + JSON.stringify(obj.$type));
      console.log("cd video autoPlay" + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
      console.log("cd video muted" + JSON.stringify(JSON.parse(strJson).$attrs.muted));
      console.log("cd video controls" + JSON.stringify(JSON.parse(strJson).$attrs.controls));
      console.log("cd video loop" + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.log("cd video objectFit" + JSON.stringify(JSON.parse(strJson).$attrs.objectFit));
      console.info('videoAppInfoTest001 END');
    });
  })
}
