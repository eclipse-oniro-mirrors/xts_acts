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

function swiperDefaultFontSize(sysWidth: Resource) {
  let resourceFontSize = getContext().resourceManager.getNumber(sysWidth.id)
  let newFontSize: string = Math.round(px2vp(resourceFontSize)) + '.00fp'
  return newFontSize;
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

export default function swiperTest_1() {
  describe('ActSwiperTest_1', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/Swiper1_1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Swipersec state success " + JSON.stringify(pages));
        if (!("Swiper1_1" == pages.name)) {
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
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0100
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0100
     * @tc.desc   Set the selectedDigitFont property parameter to {size:34,weight:"800"}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0100');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("34.00fp");
          expect(obj2.selectedFontWeight).assertEqual("800");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0200
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0200
     * @tc.desc   Set the selectedDigitFont property parameter to {size:"20px",weight:200}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0200');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("20.00px");
          expect(obj2.selectedFontWeight).assertEqual("200");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0300
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0300
     * @tc.desc   Set the selectedDigitFont property parameter to {size:"48%",weight:900}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0300');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertContain('fp');
          expect(obj2.selectedFontWeight).assertEqual("900");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0400
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0400
     * @tc.desc   Set the selectedDigitFont property parameter to {size:"",weight:FontWeight.Bolder}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0400');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertContain('fp');
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0500
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0500
     * @tc.desc   Set the selectedDigitFont property parameter to {size:-2,weight:1000}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0500');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertContain('fp');
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0600
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0600
     * @tc.desc   Set the selectedDigitFont property parameter to {size:"abc",weight:null}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0600');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertContain('fp');
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0700
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0700
     * @tc.desc   Set the selectedDigitFont property parameter to {size:"1000%",weight:""}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0700');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertContain('fp');
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0800
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0800
     * @tc.desc   Set the selectedDigitFont property parameter to {size:"100vp",weight:"adf@$5"}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0800');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("100.00vp");
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_0900
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_0900
     * @tc.desc   Set the selectedDigitFont property parameter to {size:10,weight:200},
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0900');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("40.00lpx");
          expect(obj2.selectedFontWeight).assertEqual("500");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_1000
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_1000
     * @tc.desc   Set the selectedDigitFont property parameter to {size:10,weight:500},
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_1000');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertContain('fp');
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_SelectedDigitFont_1100
     * @tc.number ArkUX_Stage_Swiper_SelectedDigitFont_1100
     * @tc.desc   Set the selectedDigitFont property parameter to {size:10,weight:600},
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_1100');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("10.00fp");
          expect(obj2.selectedFontWeight).assertEqual("600");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0100
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0100
     * @tc.desc   Set the digitFont property parameter to {size:34,weight:"800"}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0100');
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("34.00fp");
          expect(obj2.fontWeight).assertEqual("800");
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0200
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0200
     * @tc.desc   Set the digitFont property parameter to {size:"20px",weight:200}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0200');
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("20.00px");
          expect(obj2.fontWeight).assertEqual("200");
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0300
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0300
     * @tc.desc   Set the digitFont property parameter to {size:"48%",weight:900}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0300');
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertContain('fp');
          expect(obj2.fontWeight).assertEqual("900");
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0400
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0400
     * @tc.desc   Set the digitFont property parameter to {size:"",weight:FontWeight.Bolder}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0400');
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertContain('fp');
          expect(obj2.fontWeight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0500
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0500
     * @tc.desc   Set the digitFont property parameter to {size:-2,weight:1000}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0500');
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertContain('fp');
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0600
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0600
     * @tc.desc   Set the digitFont property parameter to {size:"abc",weight:null}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0600');
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertContain('fp');
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0700
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0700
     * @tc.desc   Set the digitFont property parameter to {size:"1000%",weight:""}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0700');
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertContain('fp');
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0800
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0800
     * @tc.desc   Set the digitFont property parameter to {size:"100vp",weight:"adf@$5"}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0800');
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("100.00vp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_0900
     * @tc.number ArkUX_Stage_Swiper_DigitFont_0900
     * @tc.desc   Set the digitFont property parameter to {size:10,weight:200},
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0900');
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("40.00lpx");
          expect(obj2.fontWeight).assertEqual("500");
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_1000
     * @tc.number ArkUX_Stage_Swiper_DigitFont_1000
     * @tc.desc   Set the digitFont property parameter to {size:10,weight:500},
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1000');
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertContain('fp');
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_DigitFont_1100
     * @tc.number ArkUX_Stage_Swiper_DigitFont_1100
     * @tc.desc   Set the digitFont property parameter to {size:10,weight:600},
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_DigitFont_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_DigitFont_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1100');
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("10.00fp");
          expect(obj2.fontWeight).assertEqual("600");
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_Indicator_0100
     * @tc.number ArkUX_Stage_Swiper_Indicator_0100
     * @tc.desc   Set the Indicator property parameter to top(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_Indicator_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_Indicator_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0100');
          console.info('ArkUX_Stage_Swiper_Indicator_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.top)).assertEqual(1);
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj2.indicator.top is: " +
          JSON.stringify(obj2.top));
          expect(obj2.top.substr(obj2.top.length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_Indicator_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_Indicator_0200
     * @tc.number ArkUX_Stage_Swiper_Indicator_0200
     * @tc.desc   Set the Indicator property parameter to bottom(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_Indicator_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_Indicator_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0200');
          console.info('ArkUX_Stage_Swiper_Indicator_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.bottom)).assertEqual(1);
          expect(obj2.bottom.substr(obj2.bottom.length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_Indicator_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_Indicator_0300
     * @tc.number ArkUX_Stage_Swiper_Indicator_0300
     * @tc.desc   Set the Indicator property parameter to left(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_Indicator_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_Indicator_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0300');
          console.info('ArkUX_Stage_Swiper_Indicator_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.left)).assertEqual(1);
          expect(obj2.left.substr(obj2.left.length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_Indicator_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Swiper_Indicator_0400
     * @tc.number ArkUX_Stage_Swiper_Indicator_0400
     * @tc.desc   Set the Indicator property parameter to right(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_Indicator_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Swiper_Indicator_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0400');
          console.info('ArkUX_Stage_Swiper_Indicator_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.right)).assertEqual(1);
          expect(obj2.right.substr(obj2.right.length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Swiper_Indicator_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}