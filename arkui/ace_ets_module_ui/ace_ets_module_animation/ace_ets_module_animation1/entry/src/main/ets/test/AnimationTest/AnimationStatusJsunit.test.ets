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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect} from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import events_emitter from '@ohos.events.emitter';
export default function  animationStatusJsunit() {
  describe('animationStatusJsunit', async () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/animationStatus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animationStatus state success " + JSON.stringify(pages));
        if (!("animationStatus" == pages.name)) {
          console.info("get animationStatus state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(1000);
          console.info("push animationStatus page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animationStatus page error: " + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("animationStatus after each called");
    });

    /**
     * @tc.name   animationStatus01
     * @tc.number animationStatus01
     * @tc.desc   animationStatus01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animationStatus01', Level.LEVEL0, async (done: Function) => {
      console.info('[animationStatus01] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageAnimator');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[animationStatus01] obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ImageAnimator');
      console.info('[animationStatus01] END');
      done();
    });

    /**
     * @tc.name   animationStatus02
     * @tc.number animationStatus02
     * @tc.desc   animationStatus02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animationStatus02', Level.LEVEL0, async (done: Function) => {
      console.info('[animationStatus02] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageAnimator');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[animationStatus02] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.state).assertEqual('AnimationStatus.Initial');
      console.info('[animationStatus02] END');
      done();
    });

    /**
     * @tc.name   animationStatus03
     * @tc.number animationStatus03
     * @tc.desc   animationStatus03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animationStatus03', Level.LEVEL0, async (done: Function) => {
      console.info('animationStatus03 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: ESObject) => {
        console.info("animationStatus03 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.animationStatus).assertEqual(AnimationStatus.Paused);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 56,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animationStatus03 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animationStatus03 click result is: " + JSON.stringify(sendEventByKey('button2',10,"")));
      await CommonFunc.sleep(1000);
      console.info('animationStatus03 END');
    });

    /**
     * @tc.name   animationStatus04
     * @tc.number animationStatus04
     * @tc.desc   animationStatus04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animationStatus04', Level.LEVEL0, async (done: Function) => {
      console.info('animationStatus04 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: ESObject) => {
        console.info("animationStatus04 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.animationStatus).assertEqual(AnimationStatus.Stopped);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 57,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animationStatus04 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animationStatus04 click result is: " + JSON.stringify(sendEventByKey('button3',10,"")));
      await CommonFunc.sleep(1000);
      console.info('animationStatus04 END');
    });
  })
}