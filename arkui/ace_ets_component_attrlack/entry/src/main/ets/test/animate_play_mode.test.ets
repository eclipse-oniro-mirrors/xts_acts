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
import Utils from './Utils.ets'

export default function playModeReverseJsunit() {
  describe('playModeReverseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/animate_play_mode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animate_play_mode state success " + JSON.stringify(pages));
        if (!("PlayModeReverse" == pages.name)) {
          console.info("get animate_play_mode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push animate_play_mode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animate_play_mode page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("playModeReverse after each called");
    });

    /*
 * @tc.number       SUB_ACE_BASIC_ETS_API_0001
 * @tc.name         testPlayModeReverse0001
 * @tc.desic         acePlayModeReverseEtsTest0001
 */
    it('testPlayModeReverse0001', 0, async (done: Function) => {
      console.info('PlayModeReverse testPlayModeReverse0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Reverse');
      console.info("[testradioGroup0001] component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Button');
      expect(JSON.parse(strJson).$attrs.animation).assertEqual({
        duration: 3000, // 动画时长
        curve: Curve.EaseOut, // 动画曲线
        delay: 1000, // 动画延迟
        iterations: 1, // 播放次数
        playMode: PlayMode.Reverse // 动画模式
      });
      console.info("[testPlayModeReverse0001] width value :" + JSON.parse(strJson).$attrs.animation);
      done();
    });

    /*
 * @tc.number       SUB_ACE_BASIC_ETS_API_0001
 * @tc.name         testPlayModeAlternate0001
 * @tc.desic         acePlayModeAlternateEtsTest0009
 */
    it('testPlayModeAlternate0001', 0, async (done: Function) => {
      console.info('radioGroup testPlayModeAlternate0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Alternate');
      console.info("[testPlayModeAlternate0001] component padding strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Button');
      expect(JSON.parse(strJson).$attrs.animation).assertEqual({
        duration: 3000,
        curve: Curve.EaseOut,
        delay: 1000,
        iterations: 1,
        playMode: PlayMode.Alternate
      });
      console.info("[testPlayModeAlternate0001] padding value :" + JSON.parse(strJson).$attrs.animation);
      done();
    });

  })
}