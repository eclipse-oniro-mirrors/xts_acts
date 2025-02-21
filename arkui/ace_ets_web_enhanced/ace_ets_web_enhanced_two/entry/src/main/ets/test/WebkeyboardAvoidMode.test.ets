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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function WebkeyboardAvoidMode() {

  describe('WebkeyboardAvoidMode', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebkeyboardAvoidMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebkeyboardAvoidMode state success " + JSON.stringify(pages));
        if (!("WebkeyboardAvoidMode" == pages.name)) {
          console.info("get WebkeyboardAvoidMode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebkeyboardAvoidMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebkeyboardAvoidMode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0100
    * @tc.name       : testKeyboardAvoidMode0100
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0100', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0100", 'true', 171701, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0200
    * @tc.name       : testKeyboardAvoidMode0200
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0200', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0200", 'true', 171702, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0300
    * @tc.name       : testKeyboardAvoidMode0300
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0300', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0300", 'true', 171703, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0400
    * @tc.name       : testKeyboardAvoidMode0400
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0400', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0400", 'true', 171704, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0500
    * @tc.name       : testKeyboardAvoidMode0500
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0500', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0500", 'true', 171705, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0600
    * @tc.name       : testKeyboardAvoidMode0600
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0600', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0600", 'true', 171706, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0700
    * @tc.name       : testKeyboardAvoidMode0700
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0700', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0700", 'false', 171707, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0800
    * @tc.name       : testKeyboardAvoidMode0800
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0800', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0800", 'false', 171708, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0900
    * @tc.name       : testKeyboardAvoidMode0900
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0900', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode0900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode0900", 'false', 171709, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1000
    * @tc.name       : testKeyboardAvoidMode1000
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1000', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1000", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1000", 'false', 171710, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1100
    * @tc.name       : testKeyboardAvoidMode1100
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1100', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1100", 'false', 171711, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1200
    * @tc.name       : testKeyboardAvoidMode1200
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1200', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1200", 'false', 171712, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1300
    * @tc.name       : testKeyboardAvoidMode1300
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1300', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1300", 'true', 171713, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1400
    * @tc.name       : testKeyboardAvoidMode1400
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1400', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1400", 'true', 171714, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1500
    * @tc.name       : testKeyboardAvoidMode1500
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1500', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1500", 'true', 171715, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1600
    * @tc.name       : testKeyboardAvoidMode1600
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1600', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1600", 'true', 171716, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1700
    * @tc.name       : testKeyboardAvoidMode1700
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1700', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1700", 'true', 171717, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1800
    * @tc.name       : testKeyboardAvoidMode1800
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1800', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1800", 'true', 171718, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1900
    * @tc.name       : testKeyboardAvoidMode1900
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1900', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode1900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode1900", 'true', 171719, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2000
    * @tc.name       : testKeyboardAvoidMode2000
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2000', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2000", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2000", 'true', 171720, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2100
    * @tc.name       : testKeyboardAvoidMode2100
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2100', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2100", 'true', 171721, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2200
    * @tc.name       : testKeyboardAvoidMode2200
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2200', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2200", 'true', 171722, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2300
    * @tc.name       : testKeyboardAvoidMode2300
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2300', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2300", 'true', 171723, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2400
    * @tc.name       : testKeyboardAvoidMode2400
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2400', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2400", 'true', 171724, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2500
    * @tc.name       : testKeyboardAvoidMode2500
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2500', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2500", 'false', 171725, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2600
    * @tc.name       : testKeyboardAvoidMode2600
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2600', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2600", 'false', 171726, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2700
    * @tc.name       : testKeyboardAvoidMode2700
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2700', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2700", 'false', 171727, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2800
    * @tc.name       : testKeyboardAvoidMode2800
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2800', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2800", 'false', 171728, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2900
    * @tc.name       : testKeyboardAvoidMode2900
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2900', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode2900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode2900", 'false', 171729, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_3000
    * @tc.name       : testKeyboardAvoidMode3000
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode3000', 0, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAvoidMode3000", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("emitKeyboardAvoidMode3000", 'false', 171730, done);
      sendEventByKey('keyboardAvoidMode', 10, '');
    })


  })
}
