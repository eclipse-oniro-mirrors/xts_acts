/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';

export default function marqueeJsunit() {
  describe('marqueeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/marquee',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get marquee state success " + JSON.stringify(pages));
        if (!("marquee" == pages.name)) {
          console.info("get marquee state success " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(4000);
          console.info("push marquee page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marquee page error " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.name   testMarquee_04001
     * @tc.number testMarquee_04001
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMarquee_04001', Level.LEVEL0, async (done: Function) => {
      console.info('testMarquee_04001 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontColor).assertEqual('#FF00FFFF');
      console.info('testMarquee_04001 END');
      done();
    });

    /**
     * @tc.name   testMarquee_04002
     * @tc.number testMarquee_04002
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMarquee_04002', Level.LEVEL0, async (done: Function) => {
      console.info('testMarquee_04002 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontSize).assertEqual('35.00fp');
      console.info('testMarquee_04002 END');
      done();
    });

    /**
     * @tc.name   testMarquee_04003
     * @tc.number testMarquee_04003
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMarquee_04003', Level.LEVEL0, async (done: Function) => {
      console.info('testMarquee_04003 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.allowScale).assertEqual('true');
      console.info('testMarquee_04003 END');
      done();
    });

    /**
     * @tc.name   testMarquee_04004
     * @tc.number testMarquee_04004
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMarquee_04004', Level.LEVEL0, async (done: Function) => {
      console.info('testMarquee_04004 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontWeight).assertEqual('500');
      console.info('testMarquee_04004 END');
      done();
    });

    /**
     * @tc.name   testMarquee_04005
     * @tc.number testMarquee_04005
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMarquee_04005', Level.LEVEL0, async (done: Function) => {
      console.info('testMarquee_04005 START');
      let strJsonNew = getInspectorByKey('MarqueeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      expect(obj.$attrs.fontFamily).assertEqual('medium');
      console.info('testMarquee_04005 END');
      done();
    });
  })
}