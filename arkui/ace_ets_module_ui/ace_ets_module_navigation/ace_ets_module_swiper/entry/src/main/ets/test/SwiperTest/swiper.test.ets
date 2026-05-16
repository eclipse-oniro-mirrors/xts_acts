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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';

let emitKey = "emitUserAgent";

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

async function setArrowStyle(arrowStyle: ESObject) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        "arrowStyle": JSON.stringify(arrowStyle)
      }
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("setArrowStyle start send emitKey");
    console.info("setArrowStyle backData :" + JSON.stringify(backData));
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("setArrowStyle emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000);
}

export default function swiperTest() {
  describe('ActSwiperTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/Swiper1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Swipersec state success " + JSON.stringify(pages));
        if (!("Swipersec" == pages.name)) {
          console.info("get Swipersec state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Swipersec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Swipersec page error " + JSON.stringify(err));
      }
      await sleep(2)
      done()
    });
    afterEach(async (done: Function) => {
      await setArrowStyle(
        {}
      )
      done()
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0100
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0100
     * @tc.desc   set the selectedItemWidth property parameter to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0100');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj2 is: " + JSON.stringify(obj2.selectedItemWidth));
          expect(obj2.selectedItemWidth).assertEqual("5.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0200
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0200
     * @tc.desc   Set the selectedItemWidth property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0200');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0300
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0300
     * @tc.desc   Set the selectedItemWidth property parameter to "9999vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0300');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("9999.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0400
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0400
     * @tc.desc   Set the selectedItemWidth property parameter to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0400');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0500
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0500
     * @tc.desc   Set the selectedItemWidth property parameter to "abc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0500');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0600
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0600
     * @tc.desc   Set the selectedItemWidth property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0600');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0700
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0700
     * @tc.desc   Set the selectedItemWidth property parameter to "8fp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0700');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemWidth_0800
     * @tc.number ArkUX_Stage_Swiper_SelectedItemWidth_0800
     * @tc.desc   Set the selectedItemWidth property parameter to "8lpx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0800');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0100
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0100
     * @tc.desc   Set the selectedItemHeight property parameter to 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0100');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0200
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0200
     * @tc.desc   Set the selectedItemHeight property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0200');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0300
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0300
     * @tc.desc   Set the selectedItemHeight property parameter to "9999fp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0300');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("9999.00fp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0400
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0400
     * @tc.desc   Set the selectedItemHeight property parameter to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0400');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0500
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0500
     * @tc.desc   Set the selectedItemHeight property parameter to "abc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0500');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0600
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0600
     * @tc.desc   Set the selectedItemHeight property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0600');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0700
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0700
     * @tc.desc   Set the selectedItemHeight property parameter to "8vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0700');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("8.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedItemHeight_0800
     * @tc.number ArkUX_Stage_Swiper_SelectedItemHeight_0800
     * @tc.desc   Set the selectedItemHeight property parameter to "8lpx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0800');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemWidth_0100
     * @tc.number ArkUX_Stage_Swiper_ItemWidth_0100
     * @tc.desc   Set the itemWidth property parameter to 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0100');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemWidth_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemWidth_0200
     * @tc.number ArkUX_Stage_Swiper_ItemWidth_0200
     * @tc.desc   Set the itemWidth property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0200');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0200 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemWidth_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemWidth_0300
     * @tc.number ArkUX_Stage_Swiper_ItemWidth_0300
     * @tc.desc   Set the itemWidth property parameter to "9999lpx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0300');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("9999.00lpx");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemWidth_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemWidth_0400
     * @tc.number ArkUX_Stage_Swiper_ItemWidth_0400
     * @tc.desc   Set the itemWidth property parameter to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0400');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemWidth_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemWidth_0500
     * @tc.number ArkUX_Stage_Swiper_ItemWidth_0500
     * @tc.desc   Set the itemWidth property parameter to "abc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0500');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemWidth_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemWidth_0600
     * @tc.number ArkUX_Stage_Swiper_ItemWidth_0600
     * @tc.desc   Set the itemWidth property parameter to "8px"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0600');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("8.00px");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemWidth_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemWidth_0700
     * @tc.number ArkUX_Stage_Swiper_ItemWidth_0700
     * @tc.desc   Set the itemWidth property parameter to "8fp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0700');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemWidth_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemHeight_0100
     * @tc.number ArkUX_Stage_Swiper_ItemHeight_0100
     * @tc.desc   Set the itemHeight property parameter to 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0100');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemHeight_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemHeight_0200
     * @tc.number ArkUX_Stage_Swiper_ItemHeight_0200
     * @tc.desc   Set the itemHeight property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0200');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemHeight_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemHeight_0300
     * @tc.number ArkUX_Stage_Swiper_ItemHeight_0300
     * @tc.desc   Set the itemHeight property parameter to "9999vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0300');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("9999.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemHeight_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemHeight_0400
     * @tc.number ArkUX_Stage_Swiper_ItemHeight_0400
     * @tc.desc   Set the itemHeight property parameter to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0400');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemHeight_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemHeight_0500
     * @tc.number ArkUX_Stage_Swiper_ItemHeight_0500
     * @tc.desc   Set the itemHeight property parameter to "abc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0500');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertContain('vp');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemHeight_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemHeight_0600
     * @tc.number ArkUX_Stage_Swiper_ItemHeight_0600
     * @tc.desc   Set the itemHeight property parameter to "8fp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0600');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemHeight_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_ItemHeight_0700
     * @tc.number ArkUX_Stage_Swiper_ItemHeight_0700
     * @tc.desc   Set the itemHeight property parameter to "8lpx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0700');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_ItemHeight_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0100
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0100
     * @tc.desc   Set the selectedFontColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0100');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0200
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0200
     * @tc.desc   Set the selectedFontColor property parameter to "#FFFF0000"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0200');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0300
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0300
     * @tc.desc   Set the selectedFontColor property parameter to "rgb(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0300');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0400
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0400
     * @tc.desc   Set the selectedFontColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0400');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0500
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0500
     * @tc.desc   Set the selectedFontColor property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0500');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0600
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0600
     * @tc.desc   Set the selectedFontColor property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0600');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0700
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0700
     * @tc.desc   Set the selectedFontColor property parameter to $r("app.color.selected_font_color_test")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0700');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 ERR  ' + JSON.stringify(err));
          done();
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0800
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0800
     * @tc.desc   Set the selectedFontColor property parameter to "bgr(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0800');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_0900
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_0900
     * @tc.desc   Set the selectedFontColor property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0600');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_1000
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_1000
     * @tc.desc   Set the selectedFontColor attribute parameter to "rgb (138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1000');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_1100
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_1100
     * @tc.desc   Set the selectedFontColor property parameter to 0x00ff00,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1100');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedFontColor_1200
     * @tc.number ArkUX_Stage_Swiper_SelectedFontColor_1200
     * @tc.desc   Set the selectedFontColor property parameter to "rgb (255,0,0)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1200');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0100
     * @tc.number ArkUX_Stage_Swiper_FontColor_0100
     * @tc.desc   Set the fontColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0100');
          console.info('ArkUX_Stage_Swiper_FontColor_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_FontColor_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0200
     * @tc.number ArkUX_Stage_Swiper_FontColor_0200
     * @tc.desc   Set the fontColor property parameter to "#FFFF0000"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0200');
          console.info('ArkUX_Stage_Swiper_FontColor_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_FontColor_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0300
     * @tc.number ArkUX_Stage_Swiper_FontColor_0300
     * @tc.desc   Set the fontColor property parameter to "rgb(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0300');
          console.info('ArkUX_Stage_Swiper_FontColor_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Swiper_FontColor_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0400
     * @tc.number ArkUX_Stage_Swiper_FontColor_0400
     * @tc.desc   Set the fontColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0400');
          console.info('ArkUX_Stage_Swiper_FontColor_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Swiper_FontColor_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0500
     * @tc.number ArkUX_Stage_Swiper_FontColor_0500
     * @tc.desc   Set the fontColor property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0500');
          console.info('ArkUX_Stage_Swiper_FontColor_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0600
     * @tc.number ArkUX_Stage_Swiper_FontColor_0600
     * @tc.desc   Set the fontColor property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0600');
          console.info('ArkUX_Stage_Swiper_FontColor_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0700
     * @tc.number ArkUX_Stage_Swiper_FontColor_0700
     * @tc.desc   Set the fontColor property parameter to $r("app.color.font_color_test")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0700');
          console.info('ArkUX_Stage_Swiper_FontColor_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_FontColor_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0700 ERR  ' + JSON.stringify(err));
          done();
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0800
     * @tc.number ArkUX_Stage_Swiper_FontColor_0800
     * @tc.desc   Set the fontColor property parameter to "bgr(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0800');
          console.info('ArkUX_Stage_Swiper_FontColor_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0800 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_0900
     * @tc.number ArkUX_Stage_Swiper_FontColor_0900
     * @tc.desc   Set the fontColor property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0600');
          console.info('ArkUX_Stage_Swiper_FontColor_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0900 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_1000
     * @tc.number ArkUX_Stage_Swiper_FontColor_1000
     * @tc.desc   Set the fontColor attribute parameter to "rgb (138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1000');
          console.info('ArkUX_Stage_Swiper_FontColor_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Swiper_FontColor_1000 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_1100
     * @tc.number ArkUX_Stage_Swiper_FontColor_1100
     * @tc.desc   Set the fontColor property parameter to 0x00ff00,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1100');
          console.info('ArkUX_Stage_Swiper_FontColor_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_FontColor_1100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_FontColor_1200
     * @tc.number ArkUX_Stage_Swiper_FontColor_1200
     * @tc.desc   Set the fontColor property parameter to "rgb (255,0,0)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_FontColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_FontColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1200');
          console.info('ArkUX_Stage_Swiper_FontColor_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_1200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_FontColor_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}